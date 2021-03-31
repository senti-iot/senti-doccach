#!/bin/bash
# chmod 700 api-restart.sh

if [[ "$1" == "master" ]]; then
	npm install --prefix /srv/nodejs/senti/services/doccache/production
	systemctl restart senti-doccache.service
	# Senti Slack Workspace
	curl -X POST -H 'Content-type: application/json' --data '{"text":"Senti Doccache MASTER updated and restarted!"}' $2
	echo
	exit 0
fi

if [[ "$1" == "dev" ]]; then
	npm install --prefix /srv/nodejs/senti/services/doccache/development
	systemctl restart senti-doccache-dev.service
	# Senti Slack Workspace
	curl -X POST -H 'Content-type: application/json' --data '{"text":"Senti Doccache DEV updated and restarted!"}' $2
	echo
	exit 0
fi

exit 0
