# 任意のモデル名を受け取ってマイグレーションとともにモデルを生成
migrate-%:
	docker compose run app bash -c "php artisan make:model $* --migration"

gen-controller-%: # e.g. make gen-controller-ProductController
	docker compose run app bash -c "php artisan make:controller $*"

.PHONY: migrate-%

migrate:
	docker compose exec app bash -c "php artisan migrate"

start:
	docker compose up

init:
	cp ./src/.env.example ./src/.env
	docker compose run app bash -c "composer install"
	docker compose run app bash -c "php artisan key:generate"