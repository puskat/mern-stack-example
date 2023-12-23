const express = require("express");
const recordRoutes = express.Router();
const dbo = require("../db/conn");
const ObjectId = require("mongodb").ObjectId;

// GET all records
recordRoutes.route("/record").get(async (req, res) => {
  try {
    const records = await dbo.getDb().collection("records").find({}).toArray();
    res.json(records);
  } catch (error) {
    console.error("Error fetching records:", error);
    res.status(500).send("Internal Server Error");
  }
});

// GET a record by ID
recordRoutes.route("/record/:id").get(async (req, res) => {
  try {
    const myquery = { _id: new ObjectId(req.params.id) }; // Use 'new'
    const record = await dbo.getDb().collection("records").findOne(myquery);
    if (!record) {
      return res.status(404).json({ message: "Record not found" });
    }
    res.json(record);
  } catch (error) {
    console.error("Error fetching record:", error);
    res.status(500).send("Internal Server Error");
  }
});

// POST route to create a new record
recordRoutes.route("/record/add").post(async (req, res) => {
  try {
    const newRecord = req.body;
    await dbo.getDb().collection("records").insertOne(newRecord);

    res.status(201).json({ message: "Record added successfully" });
  } catch (error) {
    console.error("Error adding record:", error);
    res.status(500).json({ message: "Error creating record" });
  }
});

// ... (rest of the routes)

recordRoutes.route("/update/:id").post(async (req, response) => {
  // Use async/await
  try {
    const db = dbo.getDb();
    const myquery = { _id: new ObjectId(req.params.id) }; // Use 'new'
    const newvalues = {
      $set: {
        name: req.body.name,
        position: req.body.position,
        level: req.body.level,
      },
    };
    await db.collection("records").updateOne(myquery, newvalues);
    response.json({ message: "Record updated successfully" });
  } catch (error) {
    console.error("Error updating record:", error);
    response.status(500).send("Error updating record");
  }
});

// This section will help you delete a record
recordRoutes.route("/:id").delete(async (req, response) => {
  try {
    const db_connect = dbo.getDb();
    const myquery = { _id: new ObjectId(req.params.id) }; // Use 'new'
    await db_connect.collection("records").deleteOne(myquery);
    console.log("1 document deleted");
    response.json({ message: "Record deleted successfully" });
  } catch (error) {
    console.error("Error deleting record:", error);
    response.status(500).send("Error deleting record");
  }
});
module.exports = recordRoutes;
