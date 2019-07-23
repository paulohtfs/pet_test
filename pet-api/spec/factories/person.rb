  FactoryBot.define do
  factory :person do
    name { Faker::Creature::Animal.name }
    document { Faker::Number.number(9) }
    birth_date { Faker::Date.birthday(18, 65) }
  end
end
