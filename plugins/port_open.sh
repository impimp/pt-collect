function port_open_requirments() {
	if [ -z "$(which ss)" ] && [ -z "$(which netstat)" ]; then
		packageRequired "iproute2"
	fi;

}

function port_open_run() {
	port=${BASH_ARGV[0]}

	if [ $( ss -H -a "( sport = :${port} or dport = :${port} )" | wc -l ) -gt 0 ]; then
		echo "Port $port isn't free";
	else
		echo "Port $port is free"
	fi
}