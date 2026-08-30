const express = require('express');
const app = express();

app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'OK',
    container: 'KRNU 847102 3',
    hash: require('fs').readFileSync('../logs/hash.sha256', 'utf8').trim()
  });
});

if (require.main === module) {
  app.listen(3000, () => console.log('Server running on port 3000'));
}

module.exports = app;
