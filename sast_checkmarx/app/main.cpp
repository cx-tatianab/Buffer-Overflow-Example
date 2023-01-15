
#include "func.hpp"

int main(int argc, char** argv)
{
  int i = 10;
  int ret = 0;
  bool bret = false;
  QCoreApplication app(argc, argv);
  //QApplication app(argc, argv);
  QTranslator translator;
  
  //printf("%s", QDir::currentPath().toLatin1());
  bret = translator.load("translations_en");
  if (!bret)
  {
    printf("fail load\n");
  }
  app.installTranslator(&translator);
  printf((QTranslator::tr("HELLO\n")).toLatin1());
  printf((QTranslator::tr("HOUSE\n")).toLatin1());
  printf((QTranslator::tr("NUMBER %d TIMES\n")).toLatin1(), i);
 
  myint();
  
  ret = getchar();
}