#include <os_internal.h>
#include "osint.h"

struct __osThreadTail __osThreadTail = {0, -1};
OSThread *__osRunQueue = (OSThread *)&__osThreadTail;
OSThread *__osActiveQueue = (OSThread *)&__osThreadTail;
#pragma data_section(".data")
OSThread *__osRunningThread = {0};
OSThread *__osFaultedThread = {0};
#pragma data_section() // Reset to default section
void __osDequeueThread(OSThread **queue, OSThread *t)
{
   register OSThread *pred;
   register OSThread *succ;
   pred = (OSThread *)queue; //this is actually legit..
   succ = pred->next;
   while (succ != NULL)
   {
      if (succ == t)
      {
         pred->next = t->next;
         return;
      }
      pred = succ;
      succ = pred->next;
   }
}

