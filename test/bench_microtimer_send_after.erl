-module(bench_microtimer_send_after).

-export([
         bench_microtimer_send_after_1mus/2,
         bench_microtimer_send_after_10mus/2,
         bench_microtimer_send_after_100mus/2,
         bench_microtimer_send_after_1ms/2,
         bench_microtimer_send_after_10ms/2,
         bench_microtimer_send_after_100ms/2
        ]).

send_after_mus_and_receive(Mus) ->
    'Elixir.MicroTimer':send_after(Mus,tick,self()),
    receive
        tick ->
            ok
        after 200 ->
            io:format("timeout out~n")
    end.

bench_microtimer_send_after_1mus(_, _) ->
    send_after_mus_and_receive(1).

bench_microtimer_send_after_10mus(_, _) ->
    send_after_mus_and_receive(10).

bench_microtimer_send_after_100mus(_, _) ->
    send_after_mus_and_receive(100).

bench_microtimer_send_after_1ms(_, _) ->
    send_after_mus_and_receive(1*1000).

bench_microtimer_send_after_10ms(_, _) ->
    send_after_mus_and_receive(10*1000).

bench_microtimer_send_after_100ms(_, _) ->
    send_after_mus_and_receive(100*1000).
