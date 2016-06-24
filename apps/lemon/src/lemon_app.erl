%%%-------------------------------------------------------------------
%% @doc lemon public API
%% @end
%%%-------------------------------------------------------------------

-module(lemon_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

%%start(_StartType, _StartArgs) ->
%%    lemon_sup:start_link().
start(_Type, _Args) ->
        Dispatch = cowboy_router:compile([
                {'_', [
                        {"/", toppage_handler, []}
                ]}
        ]),
        {ok, _} = cowboy:start_clear(http, 100, [{port, 8080}], #{
                env => #{dispatch => Dispatch}
        }),
        lemon_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
