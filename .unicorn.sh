#!/bin/bash
# This file is meant to be executed via systemd.
source /usr/local/rvm/scripts/rvm
source /etc/profile.d/rvm.sh
export ruby_ver=$(rvm list default string)

export CONFIGURED=yes
export TIMEOUT=50
export APP_ROOT=/home/rails/rails_project
export RAILS_ENV="production"
export GEM_HOME="/home/rails/eu-prometo/vendor/bundle"
export GEM_PATH="/home/rails/eu-prometo/vendor/bundle:/usr/local/rvm/gems/${ruby_ver}:/usr/local/rvm/gems/${ruby_ver}@global"
export PATH="/home/rails/eu-prometo/vendor/bundle/bin:/usr/local/rvm/gems/${ruby_ver}/bin:${PATH}"

# Passwords
export SECRET_KEY_BASE=987587bea2dc2d797daadf680545a76858b845cae698514d0daa26393b04e5b82f35132f1b148114ade593ff369fa6cc5e8a68f7ab21076eafe4f2fee2edc782
export APP_DATABASE_PASSWORD=5953863d2a357202c40582b0d90b617a

# Execute the unicorn process
/home/rails/eu-prometo/vendor/bundle/bin/unicorn \
        -c /etc/unicorn.conf -E production --debug
