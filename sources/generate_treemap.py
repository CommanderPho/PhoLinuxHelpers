#!/usr/bin/env python3
"""Generate an interactive Plotly treemap from tab-separated `du` hierarchy output."""

from __future__ import annotations

import argparse
import bisect
from pathlib import Path

import pandas as pd
import plotly.graph_objects as go


def default_output_path(input_path: Path) -> Path:
    """Derive output HTML path: `<stem>_treemap.html` next to the input file."""
    return input_path.with_name(f"{input_path.stem}_treemap.html")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate an interactive storage treemap from a `du` hierarchy TSV file.",
    )
    parser.add_argument(
        "input_file",
        type=Path,
        help="Path to tab-separated du output (columns: size, path).",
    )
    parser.add_argument(
        "-o",
        "--output",
        type=Path,
        default=None,
        help="Output HTML path (default: <input_stem>_treemap.html beside the input).",
    )
    return parser.parse_args()


def filter_leaf_rows(df: pd.DataFrame) -> pd.DataFrame:
    """Keep only leaf paths so parent `du` sizes are not double-counted.

    Uses bisect on sorted paths so siblings like `h5py-*.dist-info` (which sort
    between `h5py` and `h5py/children`) do not hide real descendants.
    """
    df = df.sort_values(by="path").reset_index(drop=True)
    paths = df["path"].tolist()
    is_leaf = []
    for i, path in enumerate(paths):
        prefix = path + "/"
        j = bisect.bisect_left(paths, prefix, lo=i + 1)
        is_leaf.append(not (j < len(paths) and paths[j].startswith(prefix)))
    return df[is_leaf].copy()


def build_treemap_hierarchy(df_leaves: pd.DataFrame) -> tuple[list[str], list[str], list[str], list[int]]:
    """Build ids/labels/parents/values for go.Treemap from leaf paths only.

    Intermediate directories get value 0 and are sized via branchvalues='remainder'.
    Using ids/parents avoids px.treemap path= collisions (e.g. tz/win.py vs tzwin.py).
    """
    ids: list[str] = []
    labels: list[str] = []
    parents: list[str] = []
    values: list[int] = []
    seen: set[str] = set()

    for path, size in zip(df_leaves["path"], df_leaves["size"]):
        parts = str(path).strip("/").split("/")
        parent_id = ""
        for depth, part in enumerate(parts, start=1):
            node_id = f"{parent_id}/{part}" if parent_id else f"/{part}"
            if node_id not in seen:
                seen.add(node_id)
                ids.append(node_id)
                labels.append(part)
                parents.append(parent_id)
                values.append(int(size) if depth == len(parts) else 0)
            parent_id = node_id

    return ids, labels, parents, values


def main() -> None:
    args = parse_args()
    input_file = args.input_file
    output_file = args.output if args.output is not None else default_output_path(input_file)

    print(f"Reading data from {input_file}...")
    df = pd.read_csv(input_file, sep="\t", header=None, names=["size", "path"])

    print("Processing hierarchical structure...")
    df_leaves = filter_leaf_rows(df)
    ids, labels, parents, values = build_treemap_hierarchy(df_leaves)

    print("Generating visualization...")
    fig = go.Figure(
        go.Treemap(
            ids=ids,
            labels=labels,
            parents=parents,
            values=values,
            branchvalues="remainder",
            marker=dict(colorscale="Blues", colors=values, showscale=True),
            root_color="lightgrey",
            hovertemplate="<b>%{label}</b><br>size=%{value}<br>%{id}<extra></extra>",
        )
    )
    fig.update_layout(title=f"Storage Space Hierarchy: {input_file.name}", margin=dict(t=50, l=25, r=25, b=25))

    fig.write_html(output_file)
    print(f"Success! Open '{output_file}' in any web browser to explore your storage.")


if __name__ == "__main__":
    main()
