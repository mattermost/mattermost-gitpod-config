_contextURL=$GITPOD_WORKSPACE_CONTEXT_URL
# _contextURL=https://github.com/mickmister/mattermost-app-file-from-text

_repo=$(echo $_contextURL | cut -d'/' -f 5)

if [[ "$_repo" != "mattermost-server" && "$_repo" != "mattermost-webapp" && "$_repo" != "mattermost-gitpod-config" && "$_repo" != "mattermost-plugin"* ]]; then
    _repoURL=$(echo $_contextURL | cut -d'/' -f 1-5)
    _cloneURL="${_repoURL}.git"
    cd /workspace
    git clone $_cloneURL

    cd /workspace/$_repo
    revision=$(echo $GITPOD_WORKSPACE_CONTEXT | jq .ref -r)
    git checkout $revision

    node /workspace/mattermost-gitpod-config/scripts/common/add-workspace-folder.js $_repo
elif [[ "$_repo" == "mattermost-plugin"* ]]; then
    gp sync-await plugin-repo-cloned
else
    exit
fi

cd /workspace/$_repo

source .gitpod/before.sh
source .gitpod/init.sh
