### BEGIN INIT INFO
# Provides:          unicorn
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts the unicorn web server
# Description:       starts unicorn
### END INIT INFO
 
USER=austin
PATH=/home/$USER/.rbenv/bin:/home/$USER/.rbenv/shims:$PATH
DAEMON=unicorn
DAEMON_OPTS="-c /home/$USER/alf/unicorn.rb -E production -D"
NAME=unicorn_alf
DESC="alf unicorn ($USER)"
PID=/home/$USER/alf/tmp/pids/unicorn.pid
 
case "$1" in
  start)
        CD_TO_APP_DIR="cd /home/$USER/alf"
        START_DAEMON_PROCESS="$DAEMON $DAEMON_OPTS"
 
        echo -n "Starting $DESC: "
        if [ `whoami` = root ]; then
          su - $USER -c "$CD_TO_APP_DIR > /dev/null 2>&1 && $START_DAEMON_PROCESS"
        else
          $CD_TO_APP_DIR > /dev/null 2>&1 && $START_DAEMON_PROCESS
        fi
        echo "$NAME."
        ;;
  stop)
        echo -n "Stopping $DESC: "
        kill -QUIT `cat $PID`
        echo "$NAME."
        ;;
  restart)
        echo -n "Restarting $DESC: "
        kill -USR2 `cat $PID`
        echo "$NAME."
        ;;
  reload)
        echo -n "Reloading $DESC configuration: "
        kill -HUP `cat $PID`
        echo "$NAME."
        ;;
  *)
        echo "Usage: $NAME {start|stop|restart|reload}" >&2
        exit 1
        ;;
esac
 
exit 0
