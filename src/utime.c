#include "bash.h"
#include <stdio.h>
#include <sys/time.h>

int utime_builtin(WORD_LIST *arguments) {
  struct timeval now;
  gettimeofday(&now, NULL);
  fprintf(stdout, "%ld.%06d\n", now.tv_sec, now.tv_usec);
  fflush(stdout);
  return EXECUTION_SUCCESS;
}

char *utime_doc[] = {
  "Prints the current system time with microsecond precision",
  (char *)NULL
};

struct builtin utime_struct = {
  "utime",
  utime_builtin,
  BUILTIN_ENABLED,
  utime_doc,
  "utime",
  0
};
