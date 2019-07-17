# Desafio Vagas.com

[![Build Status](https://travis-ci.org/VinyPinheiro/desafioVagas.svg?branch=master)](https://travis-ci.org/VinyPinheiro/desafioVagas)
[![Ruby](https://img.shields.io/badge/ruby-2.5.3-blue.svg)](https://www.ruby-lang.org)
[![Rails](https://img.shields.io/badge/rails-5.2.3-blue.svg)](http://rubyonrails.org/)

## Quadro de acompanhamento

Para ver o quadro de issues utilizado durante o desenvolvimento [Clique Aqui](https://github.com/VinyPinheiro/desafioVagas/projects/1).

## Licença

Para ver a Licença [Clique Aqui](https://github.com/VinyPinheiro/desafioVagas/blob/master/LICENSE)

## Hipóteses Assumidas

* Como uma empresa pode abrir uma vaga com a mesma especificação de uma vaga já preenchida anteriormente, minha API permite o cadastro de vagas semelhantes. Essa decisão foi tomada poisi assim, seriam isolados os candidatos que tentaram na vaga anterior e na vaga atual;
* Como os dados de uma pessoa passados não são unicos, optei por permitir o cadastro de pessoas semelhantes;

## Qualidade

Foram utilizadas algumas ferramentas que auxiliam na garantia na manutenibilidade de código e na garantia do funcionamento, sendo:
* **Rubocop:** Folha de estilo
  * Para Executar:

            $ docker exec -it desafiovagas_app_1 rubocop

* **Rspec:** Testes unitários
  * Para Executar:

            $ docker exec -it desafiovagas_app_1 rspec

* **SimpleCov:** Cobertura de Código
  * Após a execução do Rspec, será criada uma pasta chamada _coverage_ que contêm o HTML com o resultado da cobertura de código.
* **Brakeman:** Verificar falhas de segurança
  * Para Executar:

            $ docker exec -it desafiovagas_app_1 brakeman -A

  * O relatório é apresentado no próprio terminal
* **Rubycritic:** Verificar complexidade e mau cheiros de código (alguns maus cheiros foram ignorados durante o desenvolvimento)
  * Para Executar:

            $ docker exec -it desafiovagas_app_1 rubycritic app -d

  * Após a execução, será criada uma pasta _tmp/rubycritic_ que contêm o HTML com o resultado da análise.

* **TravisCI:** Usado para a integração continua, o que é uma garantia de código validado pelas regras definidas.
  * A execução ocorre após cada _push_ no repositório e faz a execução do rubocop, rspec e brakeman 

A arquitetura trabalhada foi o MVC pois é a arquitetura do framework Rails.

## Getting Started
Para facilitar o deploy foi utilizado o docker, juntamente com o docker-compose.

### Configuração com Docker

* Instalar docker

  - [Download docker](https://docs.docker.com/engine/installation/)

* Instalar docker-compose

  - [Download docker-compose](https://docs.docker.com/compose/install/)

* Construir a imagem que será usada pelo container

      $ docker-compose build

* Executar o container em segundo plano

      $ docker-compose up -d

* Configurando o banco de dados

  Para criar o banco de dados

      $ docker exec -it desafiovagas_app_1 rails db:create db:migrate

  Para popular o banco de dados com o grafo apesentado no desafio

      $ docker exec -it desafiovagas_app_1 rails db:seed

* Abra o navegador na url  http://localhost:9000/.
