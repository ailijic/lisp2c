EXE = main

CC = clang
LD = clang
CFLAGS += -MMD -MP -O2 -ggdb3 -Wall -Wextra -Wpedantic -Werror -Wno-newline-eof -Wno-unused-variable

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)

main: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

%.c: %.o
	$(CC) $(CPPFLAGS) ($CFLAGS) -c $<

.PHONY: test
test:
	$(MAKE) -C test

.PHONY: clean
clean:
	rm -f $(OBS) $(EXE)

.PHONY: cleandep
cleandep:
	rm -f $(DEPS)

-include $(DEPS)   # include all dep files in the makefile
