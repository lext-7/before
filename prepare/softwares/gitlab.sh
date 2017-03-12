#!/usr/bin/env bash

CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)

source "$CURRENT_DIR/../../common/log.sh"

log_info If you install Postfix to send email please select 'Internet Site' during setup.

sudo apt-get install curl openssh-server ca-certificates postfix

curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get install gitlab-ce

sudo gitlab-ctl reconfigure
