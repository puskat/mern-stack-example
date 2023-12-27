const { MongoClient } = require("mongodb");

const username = process.env.MONGODB_USERNAME;
const password = process.env.MONGODB_PASSWORD;
const database = process.env.MONGODB_DATABASE;
const host = process.env.MONGODB_HOST || 'mongodb';
const port = process.env.MONGODB_PORT || 27017;


const Db = `mongodb://${username}:${password}@${host}:${port}/${database}`;


const client = new MongoClient(Db, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

let _db; // Use 'let' for potential re-assignment

module.exports = {
  async connectToServer() {
    try {
      await client.connect();
      _db = client.db("employees");
      console.log("Successfully connected to MongoDB.");

      // Check if the 'employees' database exists and create it if needed
      const collections = await _db.listCollections().toArray();
      if (collections.length === 0) {
        console.log("Database 'employees' not found. Creating...");
        await _db.createCollection("records"); // Create the 'records' collection
        console.log(
          "Database 'employees' and collection 'records' created successfully."
        );
      }
    } catch (err) {
      console.error("Error connecting to MongoDB:", err);
      throw err; // Re-throw to propagate the error
    }
  },

  getDb() {
    return _db;
  },
};
