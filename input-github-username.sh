echo Hello World!
set -u;
if ! gp env | grep -q 'GITHUB_USERNAME'; then {
  until read -r -p "++++ Enter your Github username (only required once): " GITHUB_USERNAME; do continue; done
  gp env GITHUB_USERNAME="$GITHUB_USERNAME"; # Sets this variable on https://gitpod.io/variables which can be used later on
} fi

if test ! -v GITHUB_USERNAME; then {
  eval $(gp env -e);
} fi