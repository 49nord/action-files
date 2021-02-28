# GitHub file publishing actions

Deploy files to remote servers via `rsync` + SSH by copying them.

## Examples

TBW

## Alternatives

* https://github.com/Burnett01/rsync-deployments: Inspired this action. The main reason for creating this alternative was the fact that `rsync-deployments` [does not check host keys](https://github.com/Burnett01/rsync-deployments/blob/22f8d1ffe807551ba75eba6a450c3d577690249f/entrypoint.sh#L12), which, for our use case, must be turned on by default.
