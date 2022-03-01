start:
	docker-compose up -d
	docker-compose exec web rails assets:precompile
	code ./code

clean-start:
	docker-compose up -d --build
	docker-compose exec web rails assets:precompile
	code ./code
	

compile:
	docker-compose exec web rails assets:precompile

open:
	code ./code
