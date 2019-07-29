module Api
  module V1
    class AnimalsController < ApplicationController
      before_action :set_animal, only: [:show, :destroy]
      before_action :set_animals, only: :index
      before_action :set_person, if: :nested?
      before_action :set_person, only: :create

      rescue_from AnimalError::MinimalAge, with: :minimal_age
      rescue_from AnimalError::NoCatAllow, with: :no_cat_allow
      rescue_from AnimalError::MaxMonthlyCost, with: :max_monthly_cost

      def index; end

      def show; end

      def create
        @animal = Animals::Create.new(@person, animal_params).run
      end

      def destroy
        @animal.destroy
      end

      private

      def nested?
        params[:person_id].present?
      end

      def set_person
        @person = Person.find(params[:person_id])
      end

      def set_animal
        @animal = Animal.find(params[:id])
      end

      def set_animals
        @animals = Animal.all # Admin Side
        @animals = Animal.where(person: @person) if @person
      end

      def animal_params
        params
          .permit(
            :name,
            :monthly_cost,
            :person_id,
            :animal_type_id
          )
      end

      def minimal_age
        render(
          json: {
            error: 'Você deve ter 18 anos ou mais para ter uma Andorinha.' #i18n.t('errors.minimal_age')
          },
          status: :unprocessable_entity
        )
      end

      def no_cat_allow
        render(
          json: {
            error: 'Desculpe-nos, você não tem permissão pra ter um Gato, Em vez disso, tenha um Alce.' #i18n.t('errors.no_cat_allow')
          },
          status: :unprocessable_entity
        )
      end

      def max_monthly_cost
        render(
          json: {
            error: 'Para a sua segurança, não tenha mais animais.' #i18n.t('errors.max_monthly_cost')
          },
          status: :unprocessable_entity
        )
      end
    end
  end
end
