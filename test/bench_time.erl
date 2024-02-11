-module(bench_time).

-export([
         bench_nano_time/2,
         bench_monotonic_time/2
        ]).

bench_nano_time(_, _) ->
    os:system_time(nanosecond).

bench_monotonic_time(_, _) ->
    erlang:monotonic_time(nanosecond).
