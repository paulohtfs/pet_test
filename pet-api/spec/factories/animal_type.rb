
FactoryBot.define do
  factory :animal_type do
    name { Faker::Creature::Animal.name }
  end
end
