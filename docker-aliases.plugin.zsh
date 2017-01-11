# The MIT License (MIT)

# Copyright (c) 2017 Nikita P. Shupeyko

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



##########
# Images #
##########


alias di="docker images"

alias drmi="docker rmi"

alias dbu="docker build"


drmi_all() { docker rmi $* $(docker images -a -q) }

drmi_dang() { docker rmi $* $(docker images -q -f dangling='true') }



##############
# Containers #
##############


alias dps="docker ps"

alias drm="docker rm"

alias dexec="docker exec"

alias dlog="docker logs"


dip() { docker inspect --format '{{ .NetworkSettings.IPAddress }}' $* }


dstop_all() { docker stop $* $(docker ps -a -q) }


drm_stopped() { docker rm $* $(docker ps -q -f status='exited') }

drmv_stopped() { drm_stopped -v $* }


drm_all() { docker rm $* $(docker ps -a -q) }

drmv_all() { drm_all -v $* }