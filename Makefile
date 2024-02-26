# 任意のモデル名を受け取ってマイグレーションとともにモデルを生成
migrate-%:
	docker compose run app bash -c "php artisan make:model $* --migration"

.PHONY: migrate-%
