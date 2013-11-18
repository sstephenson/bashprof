../libexec/bashprof/bashprof.dylib: utime.o
	$(CC) $(CFLAGS) -dynamiclib -current_version 1.0 utime.o -o ../libexec/bashprof/bashprof.dylib

utime.o: utime.c
	$(CC) $(CFLAGS) -c utime.c -o utime.o
