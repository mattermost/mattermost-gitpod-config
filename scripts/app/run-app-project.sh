# _contextURL=$GITPOD_WORKSPACE_CONTEXT_URL
_contextURL=https://github.com/mickmister/mattermost-app-file-from-text

_repo=$(echo $_contextURL | cut -d'/' -f 5)

_repoPrefix="mattermost-app"
if [[ "$_repo" != "$_repoPrefix"* ]]; then
    echo "Not an Apps project. Doing nothing."
    exit 0
fi

cd /workspace/$_repo

cd ../$_repo && source run.sh
