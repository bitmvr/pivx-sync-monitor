# pivx-sync-monitor

A shell script utility to write out the decimal percentage for sync progress


## Setup

**Setting Your `PIVX_CLI_PATH`**

Append `export PIVX_CLI_PATH='/path/to/pivx/bin/pivx-cli'` to your `$HOME/.bash_rc` or `$HOME/.bash_profile`. If you do not export `PIVX_CLI_PATH`, the script assumes `pivx-cli` is installed in `/opt/pivx/bin/`.

**Install Dependencies**

`pivx-sync-monitor.sh` has the following dependencies:

- bc
- curl

If these dependences do not exist in your path, the script will throw an error and have an exit code of `1`.

## Usage

Once you've setup your environment, simply execute `pivx-sync-monitor.sh`

`$> ./pivx-sync-monitor.sh`


