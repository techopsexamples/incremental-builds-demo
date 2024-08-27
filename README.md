# Microservices Incremental Builds Demo

This repository demonstrates how to set up incremental builds in a Docker-based microservices environment. The CI pipeline only rebuilds the Docker images for services that have been modified, optimizing build times.

## How It Works

- The repository contains three services, each with its own Dockerfile and Flask application.
- The Makefile defines the build steps for each service.
- The GitHub Actions workflow checks which files have changed and only rebuilds the affected services.

## Running Locally

1. Clone the repository.
2. Run `make build` to build the Docker images.
3. Run `make test` to test the services.

## Incremental Builds in CI

The GitHub Actions workflow is configured to:
- Check out the code.
- Determine which services have changed.
- Build only the changed services.
- Run tests for the entire project.