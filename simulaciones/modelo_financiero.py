import numpy as np

# 11.5% error = 11.5 cont/mes * $5000 multa = $57,500/mes pérdida
ahorro_mes = 57500 * 0.9  # 90% reducción con KRONOS
sim = np.random.normal(ahorro_mes, 5000, 10000)
print(f"Ahorro mensual promedio: ${sim.mean():.2f} | Payback: {(16200/sim.mean()):.1f} meses | VAN 12 meses: ${sim.mean()*12-16200:.0f}")
