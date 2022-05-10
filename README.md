# taxonhub_2022
A information collector about species.

## How to run
### Backend
Run docker-compose to instantiate a postgresql container
```
docker-compose up --build -d
```
Install dependencies
```
yarn
```
Run the database migrations
```
yarn prisma generate
yarn prisma migrate deploy
```
Run the project
```
yarn dev
```
### Frontend
Install dependencies
```
yarn
```
Run the project
```
yarn start
```