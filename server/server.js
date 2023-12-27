const express = require("express");
const app = express();
const cors = require("cors");
require("dotenv").config({ path: "./config.env" });
const dbo = require("./db/conn");

const port = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());
app.use(require("./routes/record"));

app.get('/health', async (req, res) => {
  const isHealthy = await dbo.healthCheck();
  if (isHealthy) {
    res.status(200).send('OK');
  } else {
    res.status(500).send('Database connection is unhealthy');
  }
});

app.listen(port, async () => {
  try {
    await dbo.connectToServer();
    console.log(`Server is running on port: ${port}`);
  } catch (err) {
    console.error("Error connecting to MongoDB:", err);
    process.exit(1);
  }
});
