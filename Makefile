clear:
	rm -rf *.o *.a *_test


# ---

roots.o: roots.c roots.h
	gcc -g -c roots.c -o roots.o

roots.a: roots.o
	ar rc roots.a roots.o

roots_test.o: roots_test.c roots.h
	gcc -g -c roots_test.c -o roots_test.o

roots_test: roots_test.o roots.a
	gcc -g -o roots_test roots_test.o roots.a  -lm


test_find_roots: roots_test
	./roots_test
