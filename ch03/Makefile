all: compile tests

compile:
	erlc afile_client.erl		
	erlc afile_server.erl

clean:
	rm -vf *.beam

.PHONY: compile clean
