``` erlang
1> S = afile_server:start(".").
<0.34.0>
2> afile_client:ls(S).         
{ok,["afile_client.beam","afile_client.erl",
     "afile_server.beam","afile_server.erl","Makefile"]}
3> afile_client:get_file(S, "afile_client.erl").
{ok,<<"%% ---\n%%  Excerpted from \"Programming Erlang, Second
Edition\",\n%%  published by The Pragmatic Bookshelf.\n%%"...>>}
4> afile_client:put_file(S, "afile_client.erl").
{<0.32.0>,
 {put_file,"put",
           <<"%% ---\n%%  Excerpted from \"Programming Erlang, Second
Edition\",\n%%  published by The Pragmatic B"...>>}}
```
