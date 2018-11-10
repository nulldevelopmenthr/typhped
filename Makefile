.PHONY: docker-up
docker-up:
	docker-sync start
	docker-compose up -d

.PHONY: docker-stop
docker-stop:
	docker-compose stop
	docker-sync stop

.PHONY: docker-cli
docker-cli:
	docker-compose exec ali-cli bash
