_contextURL=$GITPOD_WORKSPACE_CONTEXT_URL

_repo=$(echo $_contextURL | cut -d'/' -f 5)

_pluginRepoPrefix="mattermost-plugin"
if [[ "$_repo" == "$_pluginRepoPrefix"* ]]; then
    _repoURL=$(echo $_contextURL | cut -d'/' -f 1-5)
else
    echo "Not a plugin project. Defaulting to Apps plugin."
    _repo="mattermost-plugin-apps"
    _repoURL="https://github.com/mattermost/$_repo"
fi

_cloneURL="${_repoURL}.git"

cd /workspace
git clone $_cloneURL
cd $_repo

node /workspace/mattermost-gitpod-config/scripts/add-workspace-folder.js $_repo

nvm install v13.14.0
MM_SERVICESETTINGS_ENABLEDEVELOPER=true make dist
