module Api
  module V1
    class AnimalTypesController < ApplicationController
      before_action :set_animal_type, only: [:show, :destroy, :update]
      before_action :set_animal_types, only: :index

      def index; end
      
      def show; end

      def create
        @animal_type = AnimalType.find_or_create_by(animal_types_params)
      end

      def destroy
        @animal_type.destroy
      end

      def update
        @animal_type.update(animal_types_params)
      end

      private

      def animal_types_params
        params.permit(:name)
      end

      def set_animal_type
        @animal_type ||= AnimalType.find(params[:id])
      end

      def set_animal_types
        @animal_types ||= AnimalType.all
      end
    end
  end
end
