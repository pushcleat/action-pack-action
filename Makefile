docker/build:
	docker build --target run  -t pushcleat/pack-action:latest .
	docker build --target test -t pushcleat/pack-action:test-latest .
