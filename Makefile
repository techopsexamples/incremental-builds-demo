.PHONY: build service1 service2 service3 clean test

build: service1 service2 service3

service1:
	@echo "Building Service 1"
	docker build -t service1 ./service1

service2:
	@echo "Building Service 2"
	docker build -t service2 ./service2

service3:
	@echo "Building Service 3"
	docker build -t service3 ./service3

clean:
	@echo "Cleaning up..."
	docker rmi service1 service2 service3 || true

test:
	@echo "Running tests..."
	@docker run -d --name service1_container service1
	@sleep 5 # Give the service some time to start
	@docker exec service1_container curl -s http://localhost:5001/ || { docker logs service1_container; exit 1; }
	@docker stop service1_container
	@docker rm service1_container
	@docker run -d --name service2_container service2
	@sleep 5 # Give the service some time to start
	@docker exec service2_container curl -s http://localhost:5002/ || { docker logs service2_container; exit 1; }
	@docker stop service2_container
	@docker rm service2_container
	@docker run -d --name service3_container service3
	@sleep 5 # Give the service some time to start
	@docker exec service3_container curl -s http://localhost:5003/ || { docker logs service3_container; exit 1; }
	@docker stop service3_container
	@docker rm service3_container
