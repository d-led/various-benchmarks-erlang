-module(bench_1).

-export([
         bench_nano_time/2
        ]).

bench_nano_time(_, _) ->
    os:system_time(nanosecond).
