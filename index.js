require('dotenv').config();
const express = require('express'); 
const cors = require('cors');


const app = express(); 
app.use(cors()); 
app.use(express.json()); 

const porta = process.env.PORT || 3333;

app.listen(porta, () => {
    console.log(`Servidor inciado em http://localhost:${porta}`);
});

app.get('/', (request, response) => {
    response.send('Hello World');
});

