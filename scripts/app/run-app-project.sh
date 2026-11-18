_contextURL=$GITPOD_WORKSPACE_CONTEXT_URL
# _contextURL=https://github.com/mickmister/mattermost-app-file-from-text

_repo=$(echo $_contextURL | cut -d'/' -f 5)

cd /workspace/$_repo

if [ -f .gitpod/before.sh ]; then source .gitpod/before.sh; fi
if [ -f .gitpod/command.sh ]; then source .gitpod/command.sh; fi
