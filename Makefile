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
	docker run --rm service1 curl -s http://localhost:5001/
	docker run --rm service2 curl -s http://localhost:5002/
	docker run --rm service3 curl -s http://localhost:5003/