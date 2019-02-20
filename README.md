# pivx-sync-monitor

A shell script utility to write out the decimal percentage for sync progress.


## Setup

**Export `PIVX_CLI_PATH`**

Append the following to your `$HOME/.bash_rc` or `$HOME/.bash_profile`. If you do not export `PIVX_CLI_PATH`, the script assumes `pivx-cli` is installed in `/opt/pivx/bin/`.

```shell
export PIVX_CLI_PATH='/path/to/pivx/bin/pivx-cli'
``` 

**Install Dependencies**

`pivx-sync-monitor.sh` has the following dependencies:

- bc
- curl

If these dependences do not exist in your path, the script will throw an error and have an exit code of `1`.

## Usage

Once you've setup your environment, simply execute `pivx-sync-monitor.sh`.

```shell
./pivx-sync-monitor.sh
```


