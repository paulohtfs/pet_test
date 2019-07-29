module Api
  module V1
    class PeopleController < ApplicationController
      before_action :set_people, only: :index

      def index; end

      private

      def set_people
        @people = Person.all
      end
    end
  end
end
