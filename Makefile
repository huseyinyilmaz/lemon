run: compile
	erl -pa ebin deps/*/ebin \
	    -i  include deps/*/include \
	    -config sys.config \
	    -sync log all \
	    -lager handlers '[{lager_console_backend, debug}]' \
	    -mnesia dir '"$(MNESIA_DIR)"' \
	    -name $(NODE_NAME) \
	    -eval "sync:go()." \
	    -s lager \
	    -s publicator_core \
	    -s publicator
