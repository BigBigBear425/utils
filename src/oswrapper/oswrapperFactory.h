#ifndef __OS_WRAPPER_FACTORY_H__
#define __OS_WRAPPER_FACTORY_H__

class OSWrapperFactory
{
public:
    virtual ~OSWrapperFactory();

    virtual OSWrapperFactory& getInstance();

public:
    virtual int threadCreate();
    virtual int threadDelete();
    virtual int threadExit();
    virtual int threadSetPriority();
    virtual int threadSleep();
    virtual int threadCancel();
    virtual int threadJoin();
    virtual int threadDetach();
    virtual int threadStart();
    virtual int threadStop();

    virtual int messageQueueCreate();
    virtual int messageQueueDelete();
    virtual int messageQueueRcv();
    virtual int messageQueueSend();
    virtual int messageQueueClear();

    virtual int semaphoreCreate();
    virtual int semaphoreDelete();
    virtual int semaphoreWait();
    virtual int semaphoreTryWait();
    virtual int semaphoreTimeoutWait();
    virtual int semaphorePost();

    virtual int timerCreate();
    virtual int timerDelete();
    virtual int timerStart();
    virtual int timerStop();

    virtual int memoryAllocate();
    virtual int memoryFree();
protected:
    OSWrapperFactory();

private:
    static OSWrapperFactory *_instance;
};

#endif

