# Projeto Pet

O projeto Pet é uma simples API de cadastro de animais.
Nela você consegue registrar o nome do seu animal, custo mensal e tipo.

Toda a API é RESTFUL, então para testar as rotas utilize a ferramenta de request
de sua escolha.
Mas lembre-se de algumas regras:

### Regras

* Pessoas podem ter vários animais
* Pessoas devem ter mais de 18 anos para ter andorinhas
* Pessoas que tenham nome começando com a letra "A" não podem ter animais do tipo Gato
* Pessoas que já tiverem custos com animais acima de 1000 não podem ter mais animais

## Development

Há duas opções para ambiente de desenvolvimento: com ou sem Docker.

#### Sem Docker

Faça o setup do ruby >= 2.5 na sua máquina.

Todo o projeto está alocado em `pet-api`, então não esqueça de entrar na pasta `cd pet-api`
Instale as dependências
```
$ bundle install
```

Configure o banco de dados e inicie a aplicação
```
$ rails db:setup
$ rails s
```

Altere a porta se necessário

#### Com Docker

Tenha o docker >= 18.x e docker-compose >= 1.24.x instalados na sua máquina.

Para iniciar rode
```
$ docker-compose up -d
```

Para acompanhar os logs

```
$ docker-compose logs -f
```

## Testing

Para rodar os testes use
```
$ rspec
or
$ docker-compose exec api bundle exec rspec
```

## Questões

Qual é o custo médio dos animais do tipo cachorro?
Para todos os animais do banco
```
Animals.joins(:animal_type).where(animal_types: { name: 'Cachorro' }).average(:monthly_cost)
```
Para todos os animais de uma pessoa
```
Person.last.animals.joins(:animal_type).where(animal_types: { name: 'Cachorro' }).average(:monthly_cost)
```

Quantos cachorros existem no sistema?

```
Animal.joins(:animal_type).where(animal_types: { name: 'Cachorro' }).count
```

Qual o nome dos donos dos cachorros (Array de nomes)
```
Person.joins(animals: :animal_type).where(animal_types: { name: 'Cachorro' }).pluck(:name)
```

