import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";

const Record = (props) => (
  <tr>
    <td>{props.record.name}</td>
    <td>{props.record.position}</td>
    <td>{props.record.level}</td>
    <td>
      <Link className="btn btn-link" to={`/edit/${props.record._id}`}>
        Edit
      </Link>{" "}
      |
      <button
        className="btn btn-link"
        onClick={() => {
          props.deleteRecord(props.record._id);
        }}
      >
        Delete
      </button>
    </td>
  </tr>
);

export default function RecordList() {
  const [records, setRecords] = useState([]);
  const [shouldRefetch, setShouldRefetch] = useState(true); // Trigger initial fetch

  useEffect(() => {
    async function getRecords() {
      try {
        const response = await fetch(`http://localhost:5000/record/`);
        if (!response.ok) {
          const message = `An error occurred: ${response.statusText}`;
          window.alert(message);
          return;
        }
        const fetchedRecords = await response.json();
        setRecords(fetchedRecords);
      } catch (error) {
        console.error("Error fetching records:", error);
        // Consider displaying a user-friendly error message here
      }
    }

    if (shouldRefetch) {
      getRecords();
      setShouldRefetch(false); // Prevent unnecessary re-fetches
    }
  }, [shouldRefetch]);

  // This method will delete a record and trigger data re-fetching
  async function deleteRecord(id) {
    await fetch(`http://localhost:5000/${id}`, {
      method: "DELETE",
    });
    setRecords(records.filter((el) => el._id !== id));
    setShouldRefetch(true); // Force re-fetch after deletion
  }

  // This following section will display the table with the records of individuals.
  return (
    <div>
      <h3>Record List</h3>
      <table className="table table-striped" style={{ marginTop: 20 }}>
        <thead>
          <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Level</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {records.map((record) => (
            <Record key={record._id} record={record} />
          ))}
        </tbody>
      </table>
    </div>
  );
}
