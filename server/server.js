const express = require("express");
const app = express();
const cors = require("cors");
require("dotenv").config({ path: "./config.env" });
const port = process.env.PORT || 5000;
app.use(cors());
app.use(express.json());
app.use(require("./routes/record"));
// get driver connection
const dbo = require("./db/conn");
app.listen(port, async () => {
  // perform a database connection when server starts
  try {
    await dbo.connectToServer();
    console.log(`Server is running on port: ${port}`);
  } catch (err) {
    console.error("Error connecting to MongoDB:", err);
    process.exit(1); // Exit if connection fails
  }
});
