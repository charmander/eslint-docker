A dockerized `eslint` that can make use of presets in `node_modules`.


## Build

```shellsession
$ docker build -t eslint .
```


## Alias

For a `.zshrc` or equivalent.

```sh
docker-eslint() {
	docker run \
		--mount type=bind,readonly,\"source="$(pwd | sed 's/"/""/g')"\",destination=/var/build \
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
