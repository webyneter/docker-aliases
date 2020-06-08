#!/usr/bin/env bash

# The MIT License (MIT)

# Copyright (c) 2017-2020 Nikita P. Shupeyko

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set -o errexit
set -o nounset
set -o noclobber

##########
# Images #
##########

alias di='docker images'

alias drmi='docker rmi'

alias dbu='docker build'

alias drmi_all='docker rmi $* $(docker images -a -q)'

alias drmi_dang='docker rmi $* $(docker images -q -f "dangling=true")'

alias dhi='docker history $*'

dhi_neat() {
  ### dhi_neat <image name>
  docker history "${1}" \
    --no-trunc \
    --format "{{ .Size }}\t{{ .CreatedBy }}" |
    sort \
      --key=1 \
      --human-numeric-sort \
      --reverse |
    column \
      -t \
      -s $"\t" |
    cut \
      --bytes=-80
}

##############
# Containers #
##############

alias dps='docker ps'

alias drit='docker run -it'

alias deit='docker exec -it'

alias dlog='docker logs'

alias dip='docker inspect --format "{{ .NetworkSettings.IPAddress }}" $*'

alias dstop_all='docker stop $* $(docker ps -q -f "status=running")'

alias drm='docker rm'

alias drm_stopped='docker rm $* $(docker ps -q -f "status=exited")'

alias drmv_stopped='docker rm -v $* $(docker ps -q -f "status=exited")'

alias drm_all='docker rm $* $(docker ps -a -q)'

alias drmv_all='docker rm -v $* $(docker ps -a -q)'

###########
# Volumes #
###########

alias dvls='docker volume ls $*'

alias dvrm_all='docker volume rm $(docker volume ls -q)'

alias dvrm_dang='docker volume rm $(docker volume ls -q -f "dangling=true")'
