setup_test:
	cd tests/setup && terraform init
	cd tests/setup && terraform apply -auto-approve
	cd tests/boundary && terraform init
	cd tests/boundary && terraform apply -auto-approve

run_test:
	./terraform test
clean:
	cd tests/configure && terraform destroy -auto-approve
	cd tests/setup && terraform destroy -auto-approve
