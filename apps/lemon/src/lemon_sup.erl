%% %%%-------------------------------------------------------------------
%% %% @doc lemon top level supervisor.
%% %% @end
%% %%%-------------------------------------------------------------------

%% -module(lemon_sup).

%% -behaviour(supervisor).

%% %% API
%% -export([start_link/0]).

%% %% Supervisor callbacks
%% -export([init/1]).

%% -define(SERVER, ?MODULE).

%% %%====================================================================
%% %% API functions
%% %%====================================================================

%% start_link() ->
%%     supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% %%====================================================================
%% %% Supervisor callbacks
%% %%====================================================================

%% %% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
%% init([]) ->
%%     {ok, { {one_for_all, 0, 1}, []} }.

%% %%====================================================================
%% %% Internal functions
%% %%====================================================================
%% Feel free to use, reuse and abuse the code in this file.

%% @private
-module(lemon_sup).
-behaviour(supervisor).

%% API.
-export([start_link/0]).

%% supervisor.
-export([init/1]).

%% API.

-spec start_link() -> {ok, pid()}.
start_link() ->
        supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% supervisor.

init([]) ->
        Procs = [],
        {ok, {{one_for_one, 10, 10}, Procs}}.
