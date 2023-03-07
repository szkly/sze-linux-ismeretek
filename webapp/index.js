import express from "express";

const app = express();

app.get("/", (req, res) => {
  return res.status(200).json({ status: "ok" });
});

const port = process.env.PORT ?? 3000;
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
