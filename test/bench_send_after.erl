-module(bench_send_after).

-export([
         bench_send_after_1ms/2,
         bench_send_after_10ms/2,
         bench_send_after_100ms/2,
         bench_baseline_send_receive/2
        ]).

send_after_ms_and_receive(Ms) ->
    erlang:send_after(Ms,self(),tick),
    receive
        tick -> 
            ok
        after 200 ->
            io:format("timeout out~n")
    end.

bench_send_after_1ms(_, _) ->
    send_after_ms_and_receive(1).

bench_send_after_10ms(_, _) ->
    send_after_ms_and_receive(10).

bench_send_after_100ms(_, _) ->
    send_after_ms_and_receive(100).

bench_baseline_send_receive(_, _) ->
    self() ! tick,
    receive
        tick -> 
            ok
    end.
