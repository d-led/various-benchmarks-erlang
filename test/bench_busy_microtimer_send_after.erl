-module(bench_busy_microtimer_send_after).

-export([
    % start/stop
    busy_microtimer_send_after/1,
    bench_busy_microtimer_send_after/2
]).

busy_microtimer_send_after(init) ->
    io:format("starting ~s~n", [?MODULE]),
    busy_loader:start();
busy_microtimer_send_after({input, _State}) ->
    no_input;
busy_microtimer_send_after({stop, State}) ->
    io:format("stopping (~p) ~s~n", [State, ?MODULE]).

bench_busy_microtimer_send_after(_Input, _Server) ->
    'Elixir.MicroTimer':send_after(10 * 1000, tick, self()),
    busy_loader:receive_tick().
