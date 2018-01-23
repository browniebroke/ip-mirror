help:
	@echo "Start locust to do some load testing"
	@echo ""
	@echo "make start HOST=http://www.example.com"
	@echo "    Start master and slaves for testing provided HOST"
	@echo "    You may provide the number of slaves with e.g. SLAVES=2"
	@echo "make clean"
	@echo "    Clean all process started"

SLAVES ?= 5

start:
	@SLAVE_ID=1 ; while [[ $$SLAVE_ID -le $(SLAVES) ]] ; do \
	    locust --slave --host=$(HOST) > log/slave$$SLAVE_ID.log 2>&1 & \
	    ((SLAVE_ID = SLAVE_ID + 1)) ; \
	done
	@locust --master --host=$(HOST) > log/master.log 2>&1 &
	@echo "Starting locust..."
	@sleep 10
	open 'http://localhost:8089'

clean:
	@pkill -f locust; :
