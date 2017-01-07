# zsh-goodies

[![build status](https://gitlab.com/webyneter/zsh-goodies/badges/master/build.svg)](https://gitlab.com/webyneter/zsh-goodies/commits/master)

A collection of Zsh helpers  


## Overview

1. [General-purpose aliases](general-purpose-aliases.zsh)
2. [Docker aliases](docker-aliases.zsh)


## Installation

### Prerequisites
1. `$ZSH_CUSTOM` is provided in `~/.zshrc`.
2. bsdtar (`sudo apt-get update && sudo apt-get install bsdtar`).

<!-- curl -sL --header "PRIVATE-TOKEN: pTnxyew5J-D1s7yezYj8" "https://gitlab.com/webyneter/zsh-goodies/builds/artifacts/TAG/download?job=release" \
 | bsdtar -xf- -C $ZSH_CUSTOM/plugins/webyneter-zsh-goodies -->

### Steps

1. Create plugin directory: 
 ```shell
 mkdir -p $ZSH_CUSTOM/plugins/webyneter-zsh-goodies
 ```

2. Download by TAG and unzip into the plugin directory: 
 ```shell 
 curl -sL "https://gitlab.com/webyneter/zsh-goodies/builds/artifacts/TAG/download?job=release" \
 | bsdtar -xf- -C $ZSH_CUSTOM/plugins/webyneter-zsh-goodies
 ```

3. Add `webyneter-zsh-goodies` to `plugins` in `~/.zshrc`:
 ```shell
 nano ~/.zshrc
 ```

4. Restart the shell for changes to take effect:
 ```shell
 exec zsh
 ```

5. That's it! See available aliases via
 ```shell
 alias
 ```