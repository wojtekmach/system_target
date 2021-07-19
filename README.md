# SystemTarget

An attempt to standardise target "triples".

Maybe it could become `%System.Target{}` and `System.target/0` one day?

## Examples

```bash
# intel mac
$ elixir -e 'Mix.install([{:system_target, github: "wojtekmach/system_target"}]); IO.puts SystemTarget.get()'
x86_64-apple-darwin-gnu

# intel mac + docker
$ docker run --rm -it elixir:1.12 elixir -e 'Mix.install([{:system_target, github: "wojtekmach/system_target"}]); IO.puts SystemTarget.get()'
x86_64-pc-darwin-gnu

# m1 macbook
$ elixir -e 'Mix.install([{:system_target, github: "wojtekmach/system_target"}]); IO.puts SystemTarget.get()'
aarch64-apple-darwin-gnu

# m1 macbook + docker
$ docker run --rm -it elixir:1.12 elixir -e 'Mix.install([{:system_target, github: "wojtekmach/system_target"}]); IO.puts SystemTarget.get()'
aarch64-unknown-linux-gnu
```
