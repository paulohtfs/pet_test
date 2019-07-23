class AnimalType < ApplicationRecord
  def cat?
    self.name.downcase == 'cat'
  end
end
