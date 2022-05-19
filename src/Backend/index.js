const app = require('./config/express');
const port = app.get('port');

app.listen(port, ()=> {
    console.log(`Aplicação rodando em http://localhost:${port}`);
});