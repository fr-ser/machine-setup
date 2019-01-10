# SSH Mounting
alias mountPiHome='sshfs pi@steinberg.home-webserver.de:/ ~/pi-home -p 8022'
alias mountPiEugen='sshfs pi@fruehling.home-webserver.de:/ ~/pi-eugen -p 8022'

# PDF quality adjustment
alias pdfEbookQuality='gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -sOutputFile=output.pdf'

# Python Quality of live
alias prp="pipenv run python"

# Docker Quality of live
docker-all() {
    docker "$1" $(docker ps -aq)
}

alias docker-kill-all='docker-all stop && docker-all rm'
