class Animal < ApplicationRecord
  belongs_to :person
  belongs_to :animal_type

  validates :name, presence: true
  validates :monthly_cost, presence: true

  alias_method :type, :animal_type
end
