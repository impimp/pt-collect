function pt_summary_requirments() {
	if [ -z "$(which wget)" ]; then
		echo $( packageRequired wget )
		return 1
	fi;

	test -e /tmp/pt-summary || (wget https://www.percona.com/get/pt-summary -O /tmp/pt-summary && chmod 755 /tmp/pt-summary )
}

pt_summary_run() {
	/tmp/pt-summary
}