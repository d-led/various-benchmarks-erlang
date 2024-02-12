-module(bench_busy_send_after).

-export([
    % start/stop
    busy_send_after/1,
    bench_busy_send_after/2
]).

busy_send_after(init) ->
    io:format("starting ~s~n", [?MODULE]),
    busy_loader:start();
busy_send_after({input, _State}) ->
    no_input;
busy_send_after({stop, State}) ->
    io:format("stopping (~p) ~s~n", [State, ?MODULE]).

bench_busy_send_after(_Input, _Server) ->
    erlang:send_after(10,self(),tick),
    busy_loader:receive_tick().
