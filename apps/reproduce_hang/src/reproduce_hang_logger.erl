-module(reproduce_hang_logger).

-export([log/2]).

log(_LogEvent, #{config := Socket}) ->
    %% Lets try to hang this release!
    Ref = make_ref(),
    io:format("~p trying to send..~n", [Ref]),
    gen_udp:send(Socket, "localhost", 12345, "Hello, world!"),
    io:format("~p done sending..~n", [Ref]),

    ok.
