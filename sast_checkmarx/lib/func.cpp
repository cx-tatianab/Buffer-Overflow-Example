#include "func.hpp"

#include <process.h>
#include <excpt.h>

void getMsg(char _thrMsgArr[10][256])
{
  memset(_thrMsgArr, 0, 10 * 256);
  sprintf(_thrMsgArr[0], "%s", QTranslator::tr("MY INT").toLocal8Bit().data());
}

int myint()
{
  char thrMsgArr[10][256];
	int i = 20;
  double d = 10.0;

  getMsg(thrMsgArr);

  __try
  {
    printf("%s: %d", thrMsgArr[0], i);
/*
    printf(QTranslator::tr("MY DOUBLE: %d").toLocal8Bit().data(), d);
    printf(QTranslator::tr("MY NUMBER: %d").toLocal8Bit().data(), d);
*/
  }
  __except(EXCEPTION_EXECUTE_HANDLER)
  {
    printf("Except...");
  }
	return i;
}
