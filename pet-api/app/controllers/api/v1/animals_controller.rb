module Api
  module V1
    class AnimalsController < ApplicationController
      before_action :set_animal, only: [:show, :destroy]
      before_action :set_animals, only: [:index]
      before_action :set_person

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

      def set_person
        @person = Person.find(params[:person_id])
      end

      def set_animal
        @animal = Animal.find(params[:id])
      end

      def set_animals
        person = Person.find(params[:person_id])
        @animals = Animal.where(person: person)
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
            error: i18n.t('errors.minimal_age')
          },
          status: :unprocessable_entity
        )
      end

      def no_cat_allow
        render(
          json: {
            error: i18n.t('errors.no_cat_allow')
          },
          status: :unprocessable_entity
        )
      end

      def max_monthly_cost
        render(
          json: {
            error: i18n.t('errors.max_monthly_cost')
          },
          status: :unprocessable_entity
        )
      end
    end
  end
end
