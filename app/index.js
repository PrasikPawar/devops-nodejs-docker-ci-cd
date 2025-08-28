const express = require('express');
const app = express();
const PORT = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.send('Hello from Node.js in a Docker container! 🚀');
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
