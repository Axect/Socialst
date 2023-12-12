# ==============================================================================
# Julia Docker
# ==============================================================================
julia() {
    if [ $# -eq 0 ]; then
        docker exec -it julia_sci julia
    else
        # Exec julia file
        docker exec -it julia_sci julia $@

        #ARGSTR=""
        #JLFILE=""
        #while [ $# -gt 0 ]; do
        #    case "$1" in
        #        --help|-h)
        #            ARGSTR+="$1 "
        #            shift
        #            ;;
        #        --*|-*)
        #            if [[ "$1" != *=* ]]; then
        #                ARGSTR+="$1 $2 "
        #                shift
        #                shift
        #            else
        #                ARGSTR+="$1 "
        #                shift
        #            fi
        #            ;;
        #        *)
        #            JLFILE="$1"
        #            shift
        #            ;;
        #    esac
        #done
        #if [ "${#JLFILE}" -eq 0 ]; then
        #    fixedfile=""
        #    wdcmd=""
        #else
        #    #prefix="$HOME/workspace/julia_sci/"
        #    wdcmd=" -w /home/quokka/$PWD:t"
        #fi
        #total="$ARGSTR$JLFILE"
        #total="$(echo -e $total | sed -e 's/[[:space:]]*$//')"
        #cmd="docker exec$wdcmd -it julia_sci julia $total"
        ##echo $cmd
        #eval $cmd
    fi
}

