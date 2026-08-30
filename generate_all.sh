const fs = require('fs');
const crypto = require('crypto');

let logs = [];
const base = Date.now() - 5 * 24 * 3600000; // 5 días atrás

for (let i = 0; i < 120; i++) {
  const tInt = -18 + (Math.random() * 0.6 - 0.3);
  logs.push({
    event_id: `EV-${String(i).padStart(4, '0')}`,
    timestamp: new Date(base + i * 3600000).toISOString(),
    container_id: 'KRNU 847102 3',
    location: i < 40 ? 'TPS_VALPARAISO' : i < 80 ? 'PANAMA_CANAL' : 'ROTTERDAM_PORT',
    temp_internal: parseFloat(tInt.toFixed(2)),
    status: Math.abs(tInt + 18) < 0.8 ? 'STABLE' : 'ALERT',
    actor: i < 40 ? 'EXPORTADOR' : 'NAVIERA'
  });
}

const json = JSON.stringify(logs, null, 2);
const hash = crypto.createHash('sha256').update(json).digest('hex');
const key = crypto.generateKeyPairSync('rsa', { modulusLength: 2048 });
const sign = crypto.sign('sha256', Buffer.from(json), key.privateKey).toString('base64');

fs.writeFileSync('logs/logs_firmados.json', json);
fs.writeFileSync('logs/audit_trail_VLP_RTM_847102.log', json);
fs.writeFileSync('logs/hash.sha256', `sha256:${hash}\nRSA-SHA256:${sign.slice(0, 64)}...`);
fs.writeFileSync('certs/pubkey.pem', key.publicKey.export({ type: 'spki', format: 'pem' }));

console.log(`✅ 120 logs | HASH: ${hash}`);
