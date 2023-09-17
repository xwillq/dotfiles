function prompt_docker_compose_status() {
    # Find current compose file
    compose_files=(compose.{yaml,yml} docker-compose.{yaml,yml})
    local compose_file
    for file in $compose_files; do
        if [[ -f "$PWD/$file" ]]; then
            compose_file="$PWD/$file"
            continue
        fi
    done
    if [[ -z "$compose_file" ]]; then
        return
    fi

    if ! docker info 2>/dev/null 1>&2; then
        return
    fi

    docker_compose_running_services=(${(f)"$(docker compose ps --services --status running)"})

    local state
    if [[ ${#docker_compose_running_services} == 0 ]]; then
        state="DOWN"
    else
        docker_compose_services=(${(f)"$(docker compose config --services)"})
        if [[ ${#docker_compose_running_services} -eq ${#docker_compose_services} ]]; then
            state="UP"
        else
            state="PARTIALLY_UP"
        fi
    fi

    local fg_color
    case $state in
        UP)
            fg_color=70
            ;;
        PARTIALLY_UP)
            fg_color=178
            ;;
        DOWN)
            fg_color=160
            ;;
        *)
            return
            ;;
    esac

    p10k segment -s $state -i '󰡨' -f $fg_color -b ''
}
