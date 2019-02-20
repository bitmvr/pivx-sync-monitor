#!/bin/bash

pivx::syncmon::depCheck() {
    dependencies=( 'bc' 'curl' )

    for dependency in ${dependencies[@]}; do
        if ! command -v "${dependency}" > /dev/null 2>&1; then
            echo "ERROR: Dependency not found '${dependency}'"
            exit 1
        fi
    done
    return 0
}

pivx::syncmon::isPIVXServ() {
  if ! ps aux | grep -Ei "pivxd -server|pivx-qt -server" | grep -iv 'grep' > /dev/null 2>&1; then
    echo "ERROR: pivxd or pivx-qt is not running or is running but was started without the -server option"
    exit 1
  fi
  return 0
}

pivx::syncmon::getLocalBlockHeight() {
    local pivx_path="${PIVX_PATH:-/opt/pivx/bin/pivx-cli}"
    "$pivx_path" getblockcount
}

pivx::syncmon::getRemoteBlockHeight() {
    curl -sL 'https://pivx.ccore.online/api/getblockcount'
}

pivx::syncmon::getPercentComplete() {
    local scale_num=3
    bc < <(echo "scale=${scale_num}; $(pivx::syncmon::getLocalBlockHeight) / $(pivx::syncmon::getRemoteBlockHeight)")
}

pivx::syncmon::main() {
    if pivx::syncmon::depCheck; then
        if pivx::syncmon::isPIVXServ; then
          pivx::syncmon::getPercentComplete
          return 0
        fi
    fi
}

pivx::syncmon::main

