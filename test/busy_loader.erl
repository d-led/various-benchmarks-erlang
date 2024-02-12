-module(busy_loader).

-export([
    start/0,
    busy_loop/0,
    receive_tick/0
]).

busy_loop(N) ->
    busy_loop(N + 1).

busy_loop() ->
    busy_loop(0).

start() ->
    N = erlang:system_info(schedulers),
    P = [spawn_link(?MODULE, busy_loop, []) || _ <- lists:seq(1, N)],
    io:format("started ~p busy loops (~p)~n", [N, P]),
    P.

receive_tick() ->
    receive
        tick ->
            ok
    after 200 ->
        io:format("timeout out~n")
    end.
