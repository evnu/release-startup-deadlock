# Try to reproduce an Erlang release startup deadlock.

This is an attempt at reproducing a logger-caused release deadlock with a pure
Erlang release. To start the release, build with rebar3:

```
$ rebar3 release
$ _build/default/rel/reproduce_hang/bin/reproduce_hang console
```

This will start an application `reproduce_hang`, which registers a logger handler at startup. The
handler `reproduce_hang_logger` attempts to resolve a name when its `log/2` function is called.
