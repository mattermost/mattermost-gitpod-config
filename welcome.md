[Gitpod](https://gitpod.io/) is a cloud development environment. We recommend checking out the [Mattermost + Gitpod guide](https://developers.mattermost.com/contribute/more-info/getting-started/using-gitpod/) in the Mattermost developer docs.

# Welcome to your very own Mattermost Gitpod workspace 🎉

We're setting up your environment in the terminals below 👇

- **Server**: Installs server dependencies, then runs the server
- **Webapp**: Install webapp dependencies, then runs a webpack process that continuously watches the source code for changes, and recompiles
- **Plugin**: If the workspace was opened from a plugin repository, the plugin is built and deployed to the Mattermost server running in Gitpod
- **App**: Runs code defined in the workspace repository in the files optionally defined in `.gitpod/init.sh` and `.gitpod/command.sh`

You can also check out these videos to learn how to work with Gitpod (and write an E2E test):
- [How to set up a developer environment for Mattermost with Gitpod](https://www.youtube.com/watch?v=LgQ2Z_GelYQ)
- [Writing your first E2E test for Mattermost](https://www.youtube.com/watch?v=mLbzKSGZv4A).

---

Once the webapp is done compiling and the Mattermost server is running, you can login with the following credentials:

- Username: sysadmin
- Password: Sys@dmin-sample1
