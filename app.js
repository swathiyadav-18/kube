// Import Express (you must have it in package.json)
const express = require('express');
const app = express();

// Set the port — use environment variable or default to 3000
const PORT = process.env.PORT || 3000;

// Basic route
app.get('/', (req, res) => {
  res.send('🚀 Hello from Node.js app deployed on Kubernetes via Jenkins!');
});

// Another sample route
app.get('/status', (req, res) => {
  res.json({ status: 'running', timestamp: new Date().toISOString() });
});

// Start server
app.listen(PORT, () => {
  console.log(`✅ Server is running on port ${PORT}`);
});
