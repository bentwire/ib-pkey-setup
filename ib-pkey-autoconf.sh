#!/bin/bash

while read -r CARD NO PORT NO2 DEV STATE
do
#	echo "'${CARD}'"
#	echo ${NO}
#	echo ${PORT}
#	echo ${NO2}
#	echo ${DEV}
#	echo ${STATE}
	if [ ${STATE} == "(Up)" ]; then
		for pkey in $(cat /sys/class/infiniband/${CARD}/ports/${PORT}/pkeys/* | egrep -v '0x0000|0xffff' ); do
			echo "Setup PKEY: ${pkey}, DEV: ${DEV}"
	                echo ${pkey} | tee /sys/class/net/${DEV}/create_child
			echo connected | tee /sys/class/net/${DEV}.${pkey#0x}/mode
		done
	fi
done < <(/usr/bin/ibdev2netdev)
