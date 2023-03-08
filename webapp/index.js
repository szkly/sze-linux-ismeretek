import express from "express";

import usersJson from "./constants/users.json" assert { type: "json" };

const app = express();

app.get("/", (req, res) => {
  return res.status(200).json({ status: "ok" });
});

app.get("/users", (req, res) => {
  return res.status(200).json({ status: "ok", users: usersJson });
});

const port = process.env.PORT ?? 3000;
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
