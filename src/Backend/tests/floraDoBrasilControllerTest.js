const app = require("../config/express");
const request = require("supertest");
const { listFDBAzurea } = require("./tests");

test("Teste de busca por Eichhornia azurea ", async () => {
  const response = await request(app)
    .post("/floradobrasil")
    .send({ names: ["Eichhornia azurea"] });
  expect(response.statusCode).toEqual(200);
  expect(response.body).toEqual(listFDBAzurea);
});