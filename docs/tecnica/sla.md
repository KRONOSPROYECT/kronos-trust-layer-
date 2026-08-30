# Acuerdo de Nivel de Servicio (SLA) - KRONOS TRUST LAYER

## Servicio
API de consulta de estado y logs para el contenedor KRNU 847102 3.

## Objetivos
- Disponibilidad mensual: 99.5%
- Tiempo de respuesta API `/health`: < 500 ms (p95)
- Integridad de logs: 100% (verificable por hash)

## Penalizaciones
- Incumplimiento de disponibilidad: crédito del 5% por cada 0.1% por debajo del objetivo.
- Pérdida de integridad: revisión inmediata y notificación al cliente.

## Soporte
- Horario: 24/7 durante el piloto.
- Tiempo de respuesta a incidentes: 15 minutos.
