#!/bin/bash

source /etc/bash/bash-color.sh

# run a command until it retrieve a 0 status code, timeout set to 10s by default
# usage: timeout command [timeout in second]
timeout () {
    set +e
    declare -i TIMEOUT=${2:-10}
    declare -i SLEEP_TIME=1
    declare -i COUNT=0
    declare -i STATUS=0
    declare -i CURRENT_TIME=$(expr $SLEEP_TIME \* $COUNT)
    while [[ $TIMEOUT -gt $CURRENT_TIME ]]; do
        COUNT=$(expr $COUNT \+ 1)
        CURRENT_TIME=$(expr $SLEEP_TIME \* $COUNT)
        eval "$1"
        STATUS=$?
        if [[ $STATUS -eq 0 ]]; then
                return 0
                set -e
        fi
        sleep $SLEEP_TIME
    done
    return 1
    set -e
}


# prompt for user input, ask until a value is enter. The variable doesn't have to be set before.
# usage: prompt variable text
# ie:    prompt FOO "What is foo ?" ; echo $FOO
prompt() {
  val=""
  def_val=${!1:-""}

  while [[ -z "$val" ]]; do
    level=$(printf '%7s:' "INPUT")
    printf "$Blue${level}$Off ${@:2:${#@}}"
    read val
    if [[ -n "$def_val" ]]; then
        break
    fi
  done

  if [[ -n "$val" ]]; then
    eval "$1=\"$val\""
  fi
}


# display the appoximative time difference relative to now
# usage:  time_ago "ISO 8601 date"
# ie:     time_ago "2014-01-14T11:07:57-0800"
# output: 1 year ago
time_ago() {
  rel_time=`date -d "$1" '+%s'`
  cur_time=`date '+%s'`
  diff=`expr $cur_time - $rel_time`
  mins=`expr $diff / 60`
  hours=`expr $mins / 60`
  days=`expr $hours / 24`
  months=`expr $days / 30`
  years=`expr $days / 365`
  
  [ $years -gt 1 ] && echo "$years years ago" || ([ $years -gt 0 ] && echo "$years year ago") || (\
    [ $months -gt 1 ] && echo "$months months ago" || ([ $months -gt 0 ] && echo "$months month ago") || (\
    [ $days -gt 1 ] && echo "$days days ago" || ([ $days -gt 0 ] && echo "$days day ago") || (\
    [ $hours -gt 1 ] && echo "$hours hours ago" || ([ $hours -gt 0 ] && echo "$hours hour ago") || (\
    [ $mins -gt 1 ] && echo "$mins minutes ago" || ([ $mins -gt 0 ] && echo "$mins minute ago") || (\
    [ $diff -gt 1 ] && echo "$diff seconds ago" || ([ $diff -gt 0 ] && echo "$diff second ago"))))))
}
