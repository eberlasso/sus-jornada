# SUS Jornada

Prontuário único da jornada do paciente no SUS, do corte do cordão umbilical em diante.
Hackathon FIAP — Pós-graduação em Arquitetura e Desenvolvimento Java, Fase 5.

## Como rodar

```bash
cp .env.example .env
docker compose up -d --build
./scripts/demo.sh
```

## Documentação
- Arquitetura: `docs/adr/`
- Swagger agregado: http://localhost:8080/swagger-ui.html
- GraphiQL do prontuário: http://localhost:8082/graphiql
- Grafana: http://localhost:3000