test: list_test

list_test: list.o test_list.o
	$(CC) $(CFLAGS) -o $@ $^

list.o: list.c list.h
	$(CC) $(CFLAGS) -c $<

test_list.o: test_list.c list.h
	$(CC) $(CFLAGS) -c $<


clear:
	@rm -rf *.o *.a list_test

fmt:
	@clang-format -style=LLVM -i *.c *.h

cFmt:
	@clang-format -style=LLVM -i *.c *.h --dry-run --Werror