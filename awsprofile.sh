#!/bin/bash

function _awsprofile {
   local AVAILABLE=$(grep \\[ ~/.aws/config|sed  -e 's/[][]//g' -e 's/profile //' | sort | sed -e 'p')
   local DEF=""
   if [[ "${AWS_PROFILE}" != "" ]]; then
       DEF="--default-item ${AWS_PROFILE}"
   fi

   local NEW
   { NEW=$(whiptail --title "AWS Profile" ${DEF} --menu "Choose AWS profile" 0 0 0 ${AVAILABLE} 2>&1 1>&$out); } {out}>&1
   export AWS_PROFILE=${NEW}
}

_awsprofile
if [[ "$AWS_PROFILE" != "" ]]; then
    echo Switched to AWS profile ${AWS_PROFILE}
fi
