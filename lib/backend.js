const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', // tu contraseña de MySQL
  database: 'universidad_db'
});

app.get('/api/materias', (req, res) => {
  db.query('SELECT * FROM materias', (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

app.listen(3000, () => console.log('Servidor activo en http://localhost:3000'));