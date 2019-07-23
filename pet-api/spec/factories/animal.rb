
FactoryBot.define do
  factory :animal do
    name { Faker::Creature::Cat.name }
    monthly_cost { rand(1..100) }

    association :person
    association :animal_type
  end
end
