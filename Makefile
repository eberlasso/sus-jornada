INFRA = postgres-patient postgres-record postgres-scheduling postgres-pharmacy postgres-central \
        mongo redis neo4j rabbitmq keycloak consul lgtm mailpit

.PHONY: infra up down logs ps clean demo token

infra:            ## Start infrastructure only
	docker compose up -d $(INFRA)

up:               ## Build and start everything
	docker compose up -d --build

down:             ## Stop everything (keeps data)
	docker compose down

clean:            ## Stop everything and DELETE all data volumes
	docker compose down -v

logs:             ## Follow logs of one service: make logs s=patient-service
	docker compose logs -f $(s)

ps:
	docker compose ps

demo:
	./scripts/demo.sh

token:            ## Print a token: make token u=dra.ana
	@curl -s -X POST http://localhost:8180/realms/sus/protocol/openid-connect/token \
	  -d grant_type=password -d client_id=sus-cli -d username=$(u) -d password=Sus@12345 | jq -r .access_token
