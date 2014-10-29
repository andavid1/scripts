#/bin/bash
pid=$!
# loop to monitor running background cmd
while :
do
    ps ax | grep $pid | grep -v grep
    ret=$?
    if test "$ret" != "0"
    then
        echo "Monitored pid ended"
        exit
    fi
    sleep 5

done

wait $pid
echo $?
