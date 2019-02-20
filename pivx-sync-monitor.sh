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
		pivx::syncmon::getPercentComplete
		return 0
	fi
}

pivx::syncmon::main

