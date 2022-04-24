echo GITHUB_USERNAME
git -C /workspace/mattermost-server remote add upstream https://github.com/mattermost/mattermost-server.git
git -C /workspace/mattermost-server remote set-url origin https://github.com/${GITHUB_USERNAME}/mattermost-server.git

git -C /workspace/mattermost-webapp remote add upstream https://github.com/mattermost/mattermost-webapp.git
git -C /workspace/mattermost-webapp remote set-url origin https://github.com/${GITHUB_USERNAME}/mattermost-webapp.git