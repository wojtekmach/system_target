# SystemTarget

An attempt to standardise target "triples".

Here are some example use cases, the following project needs to figure out the currently running target and download binary artifacts for that target:

- https://github.com/phoenixframework/esbuild
- https://github.com/ityonemo/zigler

This project obviously very naive atempt at the moment. We should look like others solve this problem, e.g. [Zig `std.Target`](https://ziglang.org/documentation/master/std/#std;Target), and figure out what makes the most sense.

Maybe it could become `%System.Target{}` and `System.target/0` one day? Or ideally: `erlang:system_info(system_target)`.

## Next steps

1. Standardize which fields to keep track of
2. Upstream it to Elixir and/or OTP. When compiling OTP we have the most precise information so that seems like the best place to standardise it.

## Examples

```bash
# intel mac
$ elixir -e 'Mix.install([{:system_target, github: "wojtekmach/system_target"}]); IO.puts SystemTarget.get()'
%SystemTarget{abi: "gnu", arch: "x86_64", cpu: "apple", os: "darwin"}

# intel mac + docker debian
$ docker run --rm -it elixir:1.12 elixir -e 'Mix.install([{:system_target, github: "wojtekmach/system_target"}]); IO.puts SystemTarget.get()'
%SystemTarget{abi: "gnu", arch: "x86_64", cpu: "pc", os: "linux"}

# m1 macbook + docker alpine
$ docker run --rm -it elixir:1.12-alpine sh -c 'apk add git; elixir -e "Mix.install([{:system_target, github: \"wojtekmach/system_target\"}]); IO.inspect SystemTarget.get()"'
%SystemTarget{abi: "musl", arch: "x86_64", cpu: "pc", os: "linux"}

# m1 macbook
$ elixir -e 'Mix.install([{:system_target, github: "wojtekmach/system_target"}]); IO.puts SystemTarget.get()'
%SystemTarget{abi: "gnu", arch: "aarch64", cpu: "apple", os: "darwin"}

# m1 macbook + docker debian
$ docker run --rm -it elixir:1.12 elixir -e 'Mix.install([{:system_target, github: "wojtekmach/system_target"}]); IO.puts SystemTarget.get()'
%SystemTarget{abi: "gnu", arch: "x86_64", cpu: "unknown", os: "linux"}

# m1 macbook + docker alpine
$ docker run --rm -it elixir:1.12-alpine sh -c 'apk add git; elixir -e "Mix.install([{:system_target, github: \"wojtekmach/system_target\"}]); IO.inspect SystemTarget.get()"'
%SystemTarget{abi: "musl", arch: "aarch64", cpu: "unknown", os: "linux"}
```
