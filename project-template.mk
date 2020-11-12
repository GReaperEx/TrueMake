% :
	@make -s -f $@.mk

%-clean :
	@make -s -f $*.mk clean

%-rebuild :
	@make -s -f $*.mk clean
	@make -s -f $*.mk

%-run :
	@make -s -f $*.mk run ARGS="$(ARGS)"