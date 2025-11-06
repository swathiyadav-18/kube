// app.js

const express = require('express');
const app = express();

const PORT = process.env.PORT || 3000;

// Root route
app.get('/', (req, res) => {
  res.send('🚀 Hello from Node.js app deployed using Jenkins, Docker, and Kubernetes!');
});

// Status route
app.get('/status', (req, res) => {
  res.json({
    status: 'running',
    time: new Date().toISOString()
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`✅ Server is running on port ${PORT}`);
});
