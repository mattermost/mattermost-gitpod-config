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

ENV GOBIN=/workspace/mattermost/server/bin
ENV GO=/workspace/server/go

ENV MM_SERVICESETTINGS_ENABLEDEVELOPER=true
