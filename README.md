# GitHub file publishing actions

Deploy files to remote servers via `rsync` + SSH by copying them. See the [`CHANGELOG.md`](CHANGELOG.md) for details.

## Examples

An example configuration for a step:

```yaml
- name: rsync deployments
  uses: 49nord/action-files@v1
  with:
    src: output/
    dest: root@example.com:/var/www/html/
    ssh_key: ${{ secrets.SSH_KEY }}
```

Note the importantance of keeping the trailing slashes on `src` and `dest` to prevent `rsync` from creating subdirectories.

## Alternatives

* <https://github.com/Burnett01/rsync-deployments>: Inspired this action. The main reason for creating this alternative was the fact that `rsync-deployments` [does not check host keys](https://github.com/Burnett01/rsync-deployments/blob/22f8d1ffe807551ba75eba6a450c3d577690249f/entrypoint.sh#L12), which, for our use case, must be turned on by default.
