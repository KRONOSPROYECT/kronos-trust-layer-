const request = require('supertest');
const app = require('../src/server');

test('GET /health retorna 200 y estado OK', async () => {
  const res = await request(app).get('/health');
  expect(res.statusCode).toBe(200);
  expect(res.body.status).toBe('OK');
  expect(res.body.container).toBe('KRNU 847102 3');
});
