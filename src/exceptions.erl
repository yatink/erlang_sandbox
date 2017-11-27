-module(exceptions).
-compile(export_all).

throws(F)->
    try F() of
        _ -> ok
    catch
        Throw -> {throw, caught, Throw}
    end.
                 
errors(F) ->
    try F() of
        _ -> function_ok
    catch
        error:Error -> {error, caught, Error}
    end.
            

sword(1) ->
    throw(slice);
sword(2) ->
    erlang:error(cut_arm);
sword(3) ->
    exit(cut_leg);
sword(4) ->
    throw(punch);
sword(5) ->
    exit(cross_bridge).

talk() ->
    "Blah Blag".

black_knight(Attack) when is_function(Attack, 0) ->
    try Attack() of
        _ ->
            "Do not pass"
    catch
        throw:slice ->
            "Hmmm..just a scratch";
        error:cut_arm ->
            "I've got another";
        exit:cut_leg -> "Weak";
        _:_ -> "Just a flesh wound"
    after
        io:format("Easy as pie")
    end.

whoa() ->
    try
        talk(),
        _Knight = "None shall pass",
        _Doubles = [N*2 || N <- lists:seq(1,100)],
        erlang:error(up),
        _Return = tequila
    of
        tequila ->
            "This worked?"
    catch
        Exception:Reason ->
            {caught, Exception, Reason}
    after
        io:format("Super eazzy")
    end.
            
            
