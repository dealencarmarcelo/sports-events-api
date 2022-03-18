# Sports Events API
> **Nota:** Teste prático realizado em março de 2022.

API responsável por gerenciar competições do COB (Comitê Olímpico Brasileiro), possibilitando a criação de competições e registro de resultados. Além de informar o ranking - parcial ou final - das competições.

## Table of Contents
- [Getting Started](#getting-started)
    - [Ambiente Local](#ambiente-local)
    - [Docker](#docker)
- [Overview](#overview)
  - [Requisitos](#requisitos)
  - [Gems](#gems)
  - [Modelos](#modelos)
  - [Funcionalidades](#funcionalidades)
  - [Modelos](#modelos)
  - [Cobertura atual de testes](#cobertura-atual-de-testes)


## Getting Started
Para começar a usar a Sports Events API são necessários alguns informações, dependendo de como você irá utilizar. São elas:

Primeiro de tudo, clonar o repositório:
```sh
git clone https://github.com/dealencarmarcelo/sports-events-api.git
```
Com isso, rodar em ambiente local:
### Ambiente local
```sh
$ bundle install
$ rake db:create && rake db:migrate && rake db:seed
$ rails s
```

Ou se preferir, utilizar o Docker:
### Docker
```sh
$ docker-compose build
$ docker-compose up
$ docker-compose run web rake db:create
$ docker-compose run web rake db:migrate
$ docker-compose run web rake db:seed
```
> **Nota:** O seed popula a Organização (COB), as modalidades e cria um usuário admin, pertencente ao COB

### Documentação de endpoints
> **Nota:** Collection zipada disponível para download, caso desejem manipular.

- [Documentação - Postman](https://documenter.getpostman.com/view/5947814/UVsPN4V7)
- [Estante Virtual - Sports API.postman_collection.zip](https://github.com/dealencarmarcelo/sports-events-api/files/8299944/Estante.Virtual.-.Sports.API.postman_collection.zip)

## Overview

### Requisitos
*Principais requisitos*
* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Docker](https://docker.wpengine.com/)

### Gems
*Principais gems*
``` ruby
ruby '3.1.0'

gem 'rails', '7.0.1'
gem 'pg' # database

# Utils
gem 'active_model_serializers' # serializer
gem 'simple_command' # service object
gem 'enumerize'

# Tests
gem 'factory_bot_rails'
gem 'faker'
gem 'rspec-rails'
gem 'shoulda-matchers'
```
### Modelos
*Principais modelos*
* Competições - `events`
* Resultados - `results`
* Modalidades - `sports`
* Usuários - `users`
* Organizações - `organizations`

### Funcionalidades
*Principais funcionalidades*
- [x] **Competições**
  - [x] Listar competições
  - [x] Visualizar uma competição
  - [x] Criar uma competição
  - [x] Editar uma competição
  - [x] Inscrever atletas (usuário)
  - [x] Listar atletas inscritos
  - [x] Visualizar ranking da competição
- [x] **Resultados**
  - [x] Listar resultados de uma competição
  - [x] Listar resultados de um atleta
  - [x] Criar resultados
  - [x] Visualizar um resultado

### Validações
*Principais destaques*
- [x] **Competições**
  - [x] Podem estar ativas ou encerradas, por status ou por período (data de início e fim)
  - [x] Não pode receber resultados caso esteja encerrada
- [x] **Modalidades**
  - [x] *100m rasos*
    - [x] Possui limite de **uma** tentativa
    - [x] Seu ranking é ordenado do **menor resultado para o maior**
  - [x] *Lançamento de dardo*
    - [x] Possui limite de **três** tentativas
    - [x] Seu ranking é ordenado do **maior resultado para o menor**

### Cobertura atual de testes
> **Nota**: arquivo gerado no dia *18/03/2022*

![Coverage](https://user-images.githubusercontent.com/24737532/158939100-85d773a4-8d83-4c5b-8c32-775c695536ae.png)


