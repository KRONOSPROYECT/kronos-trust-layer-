# BIA/BCP - RTO 4h RPO 15min - QLDB WORM + CloudHSM

## Análisis de Impacto
- Proceso crítico: registro y verificación de logs de cadena de frío.
- Impacto por interrupción: pérdida de trazabilidad, posibles rechazos de carga.

## Objetivos de recuperación
- RTO (Recovery Time Objective): 4 horas.
- RPO (Recovery Point Objective): 15 minutos.

## Estrategia
- Almacenamiento WORM con QLDB.
- Claves en CloudHSM con respaldo.
- Procedimiento de failover documentado.
