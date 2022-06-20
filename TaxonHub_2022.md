# :leaves: TaxonHub 2022
TaxonHub é um sistema de coleta e tratamento de dados taxonômicos de espécies e inventários de espécies da fauna e da flora mundial.

## Como funciona

```mermaid
graph LR
  A(Cliente) -->|Arquivo CSV| B(TaxonHub) 
  B --> C(Busca Taxonômica)
  B --> D(Busca de Ocorrências)
  C --> E(Exporta dados)
  D --> E
  E --> F(Arquivo CSV)
```

## Instalação
1. Ter instalado no ambiente:
    * [Node.js](https://nodejs.org/en/)

2. Clonar o repositório:
```bash
$ git clone https://github.com/MSechineli/taxonhub_2022.git
```

3. No diretório "backend", instalar as dependências.
```bash
$ yarn install
```

4. Executar o backend.
```bash
$ yarn start
```

## :page_with_curl: Licença
Este projeto está sob a licença [MIT](https://github.com/MSechineli/taxonhub_2022/blob/main/LICENSE).

```
MIT License

Copyright (c) 2022 reginaldo-pro

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

