#
# Regular cron jobs for the ib-pkey-setup package
#
0 4	* * *	root	[ -x /usr/bin/ib-pkey-setup_maintenance ] && /usr/bin/ib-pkey-setup_maintenance
