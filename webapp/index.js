import express from "express";

import users from "./constants/users.json" assert { type: "json" };

const app = express();

app.get("/", (req, res) => {
  return res.status(200).json({ status: "success" });
});

app.get("/users", (req, res) => {
  return res.status(200).json({ status: "success", users: users });
});

app.get("/users/:username", (req, res) => {
  const { username } = req.params;

  const requestedUser = users.find((user) => user.username == username);
  if (!requestedUser) {
    return res.status(404).json({ status: "error", reason: `Couldn't find user with username ${username}` });
  }

  return res.status(200).json({ status: "success", user: requestedUser });
});

const port = process.env.PORT ?? 3000;
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
