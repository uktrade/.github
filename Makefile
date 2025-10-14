test: 
	pytest -rP

test-coverage: 
	COVERAGE_FILE=.coverage pytest --cov-report html:htmlcov --cov=./

build-docker:
	docker build . -t dbt-security-hooks:dev --file src/hooks/Dockerfile

build-docker-local-testing:
	docker build . -t dbt-security-hooks:local-testing --target local-testing --file src/hooks/Dockerfile

validate-security:
	echo 'Hello world' >> ./tests/EXAMPLE_COMMIT_MSG.txt && hooks-cli --hook-id=validate-security-scan --verbose ./tests/EXAMPLE_COMMIT_MSG.txt

validate-security-docker:
	# the EXAMPLE_COMMIT_MSG.txt file is created inside the Dockerfile using the local-testing target
	make build-docker-local-testing
	docker run --rm dbt-security-hooks:local-testing --hook-id validate-security-scan --verbose EXAMPLE_COMMIT_MSG.txt

run-security:
	hooks-cli --hook-id=run-security-scan --verbose

run-security-docker:
	make build-docker-local-testing
	docker run --rm dbt-security-hooks:local-testing --hook-id run-security-scan --verbose src/hooks_base.py