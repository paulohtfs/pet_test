class Person < ApplicationRecord
  validates :name, presence: true
  validates :document, presence: true

  has_many :animals

  def age
    DateTime.now.year - self.birth_date.year
  end

  def can_have_swallow?
    self.age >= 18
  end

  def can_have_cat?
    !self.name.first.match?(/[Aa]/)
  end

  def can_have_more_animals?
    total_montly_cost < 1000
  end

  def total_montly_cost
    self.animals.pluck(:monthly_cost).reduce(&:+) || 0
  end
end
