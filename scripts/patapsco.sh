#!/bin/bash -x

if [ $is_patapsco = "true" ];
then
	sudo cp /tmp/patapsco_issue.net /etc/issue.net
fi
