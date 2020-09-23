%%%-------------------------------------------------------------------
%% @doc reproduce_hang public API
%% @end
%%%-------------------------------------------------------------------

-module(reproduce_hang_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    ok = register_logger(),
    reproduce_hang_sup:start_link().

stop(_State) ->
    ok.

register_logger() ->
    {ok, Socket} = gen_udp:open(0),
    Config = #{config => Socket},
    io:format("Logger config: ~p~n", [Config]),
    logger:add_handler(reproduce_hang, reproduce_hang_logger, Config).

%% internal functions
