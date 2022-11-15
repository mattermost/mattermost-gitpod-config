_contextURL=$GITPOD_WORKSPACE_CONTEXT_URL

_repo=$(echo $_contextURL | cut -d'/' -f 5)
_repoToCheckout=$_repo

_pluginRepoPrefix="mattermost-plugin"
if [[ "$_repo" == "$_pluginRepoPrefix"* ]]; then
    _repoURL=$(echo $_contextURL | cut -d'/' -f 1-5)
else
    echo "Not a plugin project. Defaulting to Apps plugin."
    _repoToCheckout="mattermost-plugin-apps"
    _repoURL="https://github.com/mattermost/${_repoToCheckout}"
fi

_cloneURL="${_repoURL}.git"

cd /workspace
git clone $_cloneURL
cd $_repoToCheckout

if [[ "$_repo" == "$_pluginRepoPrefix"* ]]; then
    revision=$(echo $GITPOD_WORKSPACE_CONTEXT | jq .ref -r)
    git checkout $revision
fi

gp sync-done plugin-repo-cloned

node /workspace/mattermost-gitpod-config/scripts/common/add-workspace-folder.js $_repo

make dist
