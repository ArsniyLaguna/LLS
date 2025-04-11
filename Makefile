clear:
	rm -rf *.o *.a *_test

fmt:
	@clang-format -style=LLVM -i `find -regex ".+\.[ch]"`

cFmt:
	@clang-format -style=LLVM -i `find -regex ".+\.[ch]"` --dry-run --Werror
# ---

integral.o: integral.c integral.h
	gcc -g -c integral.c -o integral.o

integral.a: integral.o
	ar rc integral.a integral.o

integral_test.o: integral_test.c integral.h
	gcc -g -c integral_test.c -o integral_test.o

integral_test: integral_test.o integral.a
	gcc -g -o integral_test integral_test.o integral.a -lm


test: integral_test
	./integral_test
