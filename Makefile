clear:
	rm -rf *.o *.a *_test


fmt:
	@clang-format -style=LLVM -i `find -regex ".+\.[ch]"`

cFmt:
	@clang-format -style=LLVM -i `find -regex ".+\.[ch]"` --dry-run --Werror

stack.o: stack.c stack.h
	gcc -g -c stack.c -o stack.o

stack.a: stack.o
	ar rc stack.a stack.o

stack_test.o: stack_test.c stack.h
	gcc -g -c stack_test.c -o stack_test.o

stack_test: stack_test.o stack.a
	gcc -g -o stack_test stack_test.o stack.a 


test: stack_test
	./stack_test
