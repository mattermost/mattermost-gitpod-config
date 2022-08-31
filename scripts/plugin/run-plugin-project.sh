_contextURL=$GITPOD_WORKSPACE_CONTEXT_URL

_repo=$(echo $_contextURL | cut -d'/' -f 5)

_pluginRepoPrefix="mattermost-plugin"
if [[ "$_repo" != "$_pluginRepoPrefix"* ]]; then
    echo "Not a plugin project. Defaulting to Apps plugin."
    _repo="mattermost-plugin-apps"
fi

cd /workspace/$_repo

make deploy
