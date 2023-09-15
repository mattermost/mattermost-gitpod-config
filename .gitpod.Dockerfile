FROM gitpod/workspace-full-vnc

ENV CYPRESS_CACHE_FOLDER=/workspace/.cypress-cache

# Install Cypress dependencies.
RUN sudo apt-get update \
 && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
   libgtk2.0-0 \
   libgtk-3-0 \
   libnotify-dev \
   libgconf-2-4 \
   libnss3 \
   libxss1 \
   libasound2 \
   libxtst6 \
   xauth \
   xvfb \
 && sudo rm -rf /var/lib/apt/lists/*

RUN mkdir -p /workspace/persist/.cache/go-build
ENV GOCACHE=/workspace/persist/.cache/go-build

ENV ENABLED_DOCKER_SERVICES=postgres
ENV MM_SERVICESETTINGS_ENABLEDEVELOPER=true
ENV MM_SERVICESETTINGS_ENABLELOCALMODE=true
ENV MM_SERVICESETTINGS_ENABLEBOTACCOUNTCREATION=true
ENV MM_SERVICESETTINGS_ENABLEOAUTHSERVICEPROVIDER=true
ENV MM_SERVICESETTINGS_ENABLEDEVELOPER=true
ENV MM_SERVICESETTINGS_ENABLETESTING=true
ENV MM_TEAMSETTINGS_ENABLEOPENSERVER=true
ENV MM_PLUGINSETTINGS_AUTOMATICPREPACKAGEDPLUGINS=true
ENV MM_PLUGINSETTINGS_ENABLEUPLOADS=true
ENV MM_EXPERIMENTALSETTINGS_ENABLEAPPBAR=true
ENV MM_FEATUREFLAGS_AppsEnabled=true
ENV MM_LOGSETTINGS_CONSOLELEVEL=DEBUG
ENV MM_LOGSETTINGS_FILELEVEL=DEBUG

ENV PATH="${PATH}:/workspace/mattermost/server/bin"
