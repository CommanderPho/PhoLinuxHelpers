#!/usr/bin/env python3
"""Generate an interactive Plotly treemap from tab-separated `du` hierarchy output."""

from __future__ import annotations

import argparse
from pathlib import Path

import pandas as pd
import plotly.express as px


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


def main() -> None:
    args = parse_args()
    input_file = args.input_file
    output_file = args.output if args.output is not None else default_output_path(input_file)

    print(f"Reading data from {input_file}...")
    df = pd.read_csv(input_file, sep="\t", header=None, names=["size", "path"])

    # Filter out parent directory sizes to avoid double-counting.
    # Sorting alphabetically ensures parent directories immediately precede their sub-items.
    df = df.sort_values(by="path").reset_index(drop=True)

    is_leaf = []
    for i in range(len(df) - 1):
        # If the next path starts with the current path + '/', the current item is a parent directory
        if df["path"].iloc[i + 1].startswith(df["path"].iloc[i] + "/"):
            is_leaf.append(False)
        else:
            is_leaf.append(True)
    ## END for i in range(len(df) - 1)...

    # The last item in the sorted list is always a leaf
    is_leaf.append(True)

    df_leaves = df[is_leaf].copy()

    print("Processing hierarchical structure...")
    split_paths = df_leaves["path"].str.strip("/").str.split("/", expand=True)

    df_plot = pd.concat(
        [df_leaves[["size"]].reset_index(drop=True), split_paths.reset_index(drop=True)],
        axis=1,
    )

    path_cols = list(split_paths.columns)

    print("Generating visualization...")
    fig = px.treemap(
        df_plot,
        path=path_cols,
        values="size",
        title=f"Storage Space Hierarchy: {input_file.name}",
        color="size",
        color_continuous_scale="Blues",
    )

    fig.update_traces(root_color="lightgrey")
    fig.update_layout(margin=dict(t=50, l=25, r=25, b=25))

    fig.write_html(output_file)
    print(f"Success! Open '{output_file}' in any web browser to explore your storage.")


if __name__ == "__main__":
    main()
