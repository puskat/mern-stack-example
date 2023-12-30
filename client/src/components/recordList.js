import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";

const Record = ({ record, deleteRecord }) => (
  <tr>
    <td>{record.name}</td>
    <td>{record.position}</td>
    <td>{record.level}</td>
    <td>
      <Link className="btn btn-link" to={`/edit/${record._id}`}>
        Edit
      </Link>{" "}
      |
      <button className="btn btn-link" onClick={() => deleteRecord(record._id)}>
        Delete
      </button>
    </td>
  </tr>
);

export default function RecordList() {
  const [records, setRecords] = useState([]);
  const [shouldRefetch, setShouldRefetch] = useState(true);
  const [isDeleting, setIsDeleting] = useState(false);

  useEffect(() => {
    async function getRecords() {
      try {
        const response = await fetch(`/api/record/`);
        if (!response.ok) {
          throw new Error(`HTTP error: ${response.status}`);
        }
        const fetchedRecords = await response.json();
        setRecords(fetchedRecords);
      } catch (error) {
        console.error("Error fetching records:", error);
      }
    }

    if (shouldRefetch) {
      getRecords();
      setShouldRefetch(false);
    }
  }, [shouldRefetch]);

  async function deleteRecord(id) {
    setIsDeleting(true); 
    try {
      await fetch(`/api/${id}`, { 
        method: "DELETE",
      });
      setRecords(records.filter((el) => el._id !== id));
    } catch (error) {
      console.error("Error deleting record:", error);
    } finally {
      setIsDeleting(false);
      setShouldRefetch(true); 
    }
  }

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
            <Record
              key={record._id}
              record={record}
              deleteRecord={deleteRecord}
            />
          ))}
        </tbody>
      </table>
      {isDeleting && <p>Deleting record...</p>} 
    </div>
  );
}
