A dockerized ESLint that can make use of presets in `node_modules`.

**Deprecated: [faster linters][1] and [better sandboxes][2] are available**

  [1]: https://github.com/denoland/deno_lint
  [2]: https://github.com/containers/bubblewrap


## Build

```shellsession
$ docker build -t eslint .
```


## Alias

For a `.zshrc` or equivalent.

```sh
docker-eslint() {
	docker run \
		--pull=never \
		--mount "type=bind,readonly,\"source=${PWD//\"/\"\"}\",destination=/var/build" \
		--network=none --security-opt=no-new-privileges \
		--rm -it eslint "$@"
}
```

[`--mount` is a CSV.][1]


## Use

```shellsession
$ docker-eslint -f codeframe .
```


  [1]: https://github.com/docker/cli/blob/6ef0ea82ea3d27467479ad0365940a5b384e081e/opts/mount.go#L23
