function _prompt_awsprofile {
    if [[ "${AWS_PROFILE}" != "" ]]; then
	echo "[AWS:${AWS_PROFILE}]"
    fi
}
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\e[91m\]$(_prompt_awsprofile)\[\033[01;33m\]\w\[\033[00m\]\$ '
