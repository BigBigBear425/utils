#include "oswrapperFactory.h"

OSWrapperFactory* OSWrapperFactory::_instance = 0;

OSWrapperFactory::OSWrapperFactory()
{
}

OSWrapperFactory::~OSWrapperFactory()
{
}

OSWrapperFactory& OSWrapperFactory::getInstance()
{
    if( !_instance )
        _instance = new OSWrapperFactory;
    
    return *_instance;
}
