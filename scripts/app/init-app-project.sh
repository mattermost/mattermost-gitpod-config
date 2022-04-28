# _contextURL=$GITPOD_WORKSPACE_CONTEXT_URL
_contextURL=https://github.com/mickmister/mattermost-app-file-from-text

_repo=$(echo $_contextURL | cut -d'/' -f 5)

_repoPrefix="mattermost-app"
if [[ "$_repo" == "$_repoPrefix"* ]]; then
    _repoURL=$(echo $_contextURL | cut -d'/' -f 1-5)
else
    echo "Not an Apps project."
    exit 0
fi

_cloneURL="${_repoURL}.git"

cd /workspace
git clone $_cloneURL
cd $_repo

node /workspace/mattermost-gitpod-config/scripts/common/add-workspace-folder.js $_repo

cd ../$_repo
source install.sh

cd ../$_repo && source install.sh
