-module(test).

-compile({parse_transform, plc}).

-compile(export_all).

test() ->
    Result = plc:lc([{self(), A, B, C} || A <- lists:seq(1,2),
                                  B <- lists:seq(3,4),
                                  C <- lists:seq(5,6),
                                  A * B < 5
                                 ]),
    io:format("~p~n", [Result]).
