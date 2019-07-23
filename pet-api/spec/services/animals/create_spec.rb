require "rails_helper"

RSpec.describe Animals::Create, type: :services do
  describe '.run' do
    let(:person) { create(:person) }
    let(:animal_type) { create(:animal_type) }
    let(:animal_params) do
      {
        name: Faker::Creature::Cat.name,
        monthly_cost: rand(1..100),
        person_id: person.id,
        animal_type_id: animal_type.id
      }
    end
    let(:animals_create) do
      described_class.new(person, animal_params)
    end

    context 'when valid' do
      it 'creates a animal' do
        expect{ animals_create.run }.to change{ Animal.count }.by(1)
      end
    end

    context 'when invalid' do
      context 'and not allow to have swallow' do
        let(:person) { create(:person, birth_date: Faker::Date.birthday(1, 17)) }

        it 'raise minimal age error' do
          expect{ animals_create.run }.to raise_error(AnimalError::MinimalAge)
        end
      end

      context 'and not allow to have cat' do
        let(:person) { create(:person, name: 'Alice') }
        let(:animal_type) { create(:animal_type, name: 'Cat') }

        it 'raise no cat allow' do
          expect { animals_create.run }.to raise_error(AnimalError::NoCatAllow)
        end
      end

      context 'and not allow to have more animals' do
        let!(:animal) { create(:animal, monthly_cost: 1000.1, person: person) }

        it 'raise no max monthly cost' do
          expect { animals_create.run }.to raise_error(AnimalError::MaxMonthlyCost)
        end
      end
    end
  end
end
