_contextURL=$GITPOD_WORKSPACE_CONTEXT_URL
# _contextURL=https://github.com/mickmister/mattermost-app-file-from-text

_repo=$(echo $_contextURL | cut -d'/' -f 5)

cd /workspace/$_repo

source .gitpod/before.sh
source .gitpod/command.sh
