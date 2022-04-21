set -u;
if ! gp env | grep -q 'GITHUB_USERNAME'; then {
  until read -r -p "++++ Enter your Github username (only required once): " GITHUB_USERNAME; do continue; done
  gp env GITHUB_USERNAME="$GITHUB_USERNAME"; # Sets this variable on https://gitpod.io/variables which can be used later on
} fi

if test ! -v GITHUB_USERNAME; then {
  eval $(gp env -e);
} fi

git -C /workspace/mattermost-gitpod-config remote add upstream https://github.com/mattermost/mattermost-gitpod-config.git
git -C /workspace/mattermost-gitpod-config remote set-url origin https://github.com/${GITHUB_USERNAME}/mattermost-gitpod-config.git

git -C /workspace/mattermost-server remote add upstream https://github.com/mattermost/mattermost-server.git
git -C /workspace/mattermost-server remote set-url origin https://github.com/${GITHUB_USERNAME}/mattermost-server.git

git -C /workspace/mattermost-webapp remote add upstream https://github.com/mattermost/mattermost-webapp.git
git -C /workspace/mattermost-webapp remote set-url origin https://github.com/${GITHUB_USERNAME}/mattermost-webapp.git