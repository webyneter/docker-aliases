# Get all docker-related aliases 
# (for this one, much thanks to https://github.com/tcnksm/docker-alias/blob/master/zshrc)
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
this repository


##########
# Images #
##########


# Basic

alias di="docker images"

alias drmi="docker rmi"

alias dbu="docker build"


# Complex

drmi_fall() { "docker rmi -f $* $(docker images -a -q)" }

drmi_dang() { "docker rmi $* $(docker images -a -q -f dangling='true')" }



##############
# Containers #
##############


# Basic

alias dlog="docker logs"

alias dps="docker ps"

alias drm="docker rm"

alias dexec="docker exec"


# Complex

dip() { "docker inspect --format '{{ .NetworkSettings.IPAddress }}'" }

dpsa() { "docker ps -a" }

dstop_all() { "docker stop $* $(docker ps -a -q)" }

drm_stop() { "docker rm $* $(docker ps -q -f status='exited')" }

drm_all() { "docker rm $* $(docker ps -a -q)" }

drm_fall() { "docker rm -f $* $(docker ps -a -q)" }
