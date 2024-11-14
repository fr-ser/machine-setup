# Docker Quality of live
docker-clean-slate() {
    docker kill $(docker ps -q)
    docker rm $(docker ps -aq)
    docker system prune -f --volumes
}

docker-compose-restart() {
	docker-compose stop $@
	docker-compose rm -f -v $@
	docker-compose up --build -d $@
}

# Common ps grep
psgrep() {
    ps aux | grep "$1"
}

# JWT decoder
jwtd() {
    if [[ -x $(command -v jq) ]]; then
         jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' <<< "${1}"
         echo "Signature: $(echo "${1}" | awk -F'.' '{print $3}')"
    fi
}

# kubectl
alias k="kubectl"

# standard bash commands
alias l="ls -lah"

alias git-graph="git log --all --decorate --oneline --graph"

alias js-scripts="jq '.scripts' package.json"
