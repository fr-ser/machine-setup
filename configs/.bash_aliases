# SSH Mounting
alias mountPiHome='sshfs pi@steinberg.home-webserver.de:/ ~/pi-home -p 8022'

# PDF quality adjustment
alias pdfEbookQuality='gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -sOutputFile=output.pdf'

# Python Quality of live
alias prp="pipenv run python"

# Docker Quality of live
docker-all() {
    local USAGE=""
    read -r -d '' USAGE <<EOM
        This bash function exectures a docker command against different containers.
        Usage: docker-all <cmd> <opts>
        <cmd>: Can be any docker command (such as kill, stop, rm)
        <opts>:
                "-A": Disables "-a" ond docker ps (only run command against running containers)
EOM

    if [[ "$1" == "-h" || "$1" == "--help" ]]
    then
        echo $USAGE
    elif [[ "$2" != "-A" ]]
    then
        docker "$1" $(docker ps -aq)
    else
        # "Q" was passed as an argument, don't use quiet mode
        docker "$1" $(docker ps -q)
    fi
}

alias docker-kill-all='docker-all stop && docker-all rm'

# kubectl
alias k="kubectl"

# standard bash commands
alias l="ls -lah"
