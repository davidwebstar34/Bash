#!/bin/bash

case "$1" in
    debug)
        echo "Debug service"
        ;;
    start)
        echo "Start service"
        ;;
    stop)
        echo "Stop service"
        ;;
    restart)
        echo "Restart service"
        ;;
    status)
        echo "Status service"
        # ps aux | grep ${application}
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 0
        ;;
esac

 
