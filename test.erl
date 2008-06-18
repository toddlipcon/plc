-module(test).

-compile({parse_transform, parallel_lc}).

-compile(export_all).

test() ->
    [spawn(fun() -> X * 3 end) || X <- lists:seq(1,10)],


    ZipList = lists:zip(lists:seq(1,10), lists:seq(11, 20)),

    Result = plc:lc([{self(), A * 3 + B} || {A, B} <- ZipList, A + B < 25]),
    NormalResult = [{self(), A * 3 + B} || {A, B} <- ZipList, A + B < 25],
    io:format("~p~n", [Result]),
    io:format("~p~n", [NormalResult]).
