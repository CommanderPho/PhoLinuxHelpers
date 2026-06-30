#!/bin/bash

# mirror_data_to_scratch.sh
# Mirror /nfs/turbo/umms-kdiba/Data to /scratch/kdiba_root/kdiba99/halechr/Data via rsync.
#
# Example usage:
# source "$HOME/repos/PhoLinuxHelpers/sources/greatlakes_Helpers/mirror_data_to_scratch.sh"
# mirror_turbo_data_to_scratch KDIBA/gor01/one --dry-run
# mirror_turbo_data_to_scratch --delete
# "$HOME/repos/PhoLinuxHelpers/sources/greatlakes_Helpers/mirror_data_to_scratch.sh" KDIBA/gor01/one

SOURCE_DATA_ROOT="/nfs/turbo/umms-kdiba/Data"
DEST_DATA_ROOT="/scratch/kdiba_root/kdiba99/halechr/Data"
LOG_DIR="/scratch/kdiba_root/kdiba99/halechr/logs"


_parse_mirror_args() {
    SUBPATH=""
    DRY_RUN=false
    DELETE=false
    for arg in "$@"; do
        case "$arg" in
            --dry-run) DRY_RUN=true ;;
            --delete) DELETE=true ;;
            -*) echo "Unknown option: $arg" >&2; return 1 ;;
            *)
                if [ -z "$SUBPATH" ]; then
                    SUBPATH="$arg"
                else
                    echo "Unexpected extra argument: $arg" >&2
                    return 1
                fi
                ;;
        esac
    done
    return 0
}


mirror_turbo_data_to_scratch() {
    if ! _parse_mirror_args "$@"; then
        return 1
    fi

    local source_path="${SOURCE_DATA_ROOT}"
    local dest_path="${DEST_DATA_ROOT}"
    if [ -n "$SUBPATH" ]; then
        source_path="${SOURCE_DATA_ROOT}/${SUBPATH}"
        dest_path="${DEST_DATA_ROOT}/${SUBPATH}"
    fi

    if [ ! -d "$source_path" ]; then
        echo "Source path does not exist or is not a directory: $source_path" >&2
        return 1
    fi
    if [ ! -r "$source_path" ]; then
        echo "Source path is not readable: $source_path" >&2
        return 1
    fi

    mkdir -p "$dest_path" "$LOG_DIR" || return 1

    local timestamp
    timestamp=$(date +"%Y-%m-%d_%H%M%S")
    local log_file="${LOG_DIR}/mirror_data_to_scratch_${timestamp}.log"
    local rsync_flags=(-a --info=progress2 --partial)
    if [ "$DELETE" = true ]; then
        rsync_flags+=(--delete)
    fi
    if [ "$DRY_RUN" = true ]; then
        rsync_flags+=(-n)
    fi

    echo "Mirror turbo Data to scratch"
    echo "  Source:     ${source_path}/"
    echo "  Dest:       ${dest_path}/"
    echo "  Subpath:    ${SUBPATH:-<full Data tree>}"
    echo "  Dry run:    ${DRY_RUN}"
    echo "  Delete:     ${DELETE}"
    echo "  Log file:   ${log_file}"

    set -o pipefail
    {
        echo "=== mirror_turbo_data_to_scratch ${timestamp} ==="
        echo "Source: ${source_path}/"
        echo "Dest:   ${dest_path}/"
        echo "Flags:  dry_run=${DRY_RUN} delete=${DELETE}"
        echo ""
        rsync "${rsync_flags[@]}" "${source_path}/" "${dest_path}/"
        local rsync_exit=$?
        echo ""
        echo "=== rsync exit code: ${rsync_exit} ==="
        exit $rsync_exit
    } 2>&1 | tee "$log_file"
    local mirror_exit=${PIPESTATUS[0]}
    set +o pipefail
    return $mirror_exit
}


main() {
    mirror_turbo_data_to_scratch "$@"
}


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
