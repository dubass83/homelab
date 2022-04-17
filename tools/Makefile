.POSIX:

TAG = homelab-tools

default: build run

build:
	@docker build . --tag ${TAG}

run:
	@docker run \
		--rm \
		--interactive \
		--tty \
		--env "TERM=${TERM}" \
		--env "HOME=${HOME}" \
		--volume "${HOME}:${HOME}" \
		--volume "/var/run/docker.sock:/var/run/docker.sock" \
		--volume "/etc/passwd:/etc/passwd" \
		--volume "/etc/shadow:/etc/shadow" \
		--volume "/etc/group:/etc/group" \
		--volume "/etc/sudoers:/etc/sudoers" \
		--user "$(shell id -u ${USER}):$(shell id -g ${USER})" \
		--group-add "$(shell getent group docker | cut -d ':' -f 3)" \
		--workdir "$(shell pwd)/.." \
		${TAG}
