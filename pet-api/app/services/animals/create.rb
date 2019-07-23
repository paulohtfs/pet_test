class Animals::Create
  def initialize(person, animal_params)
    @person = person
    @animal_params = animal_params
  end

  def run
    validate_person
    create_animal
  end

  private

  def validate_person
    raise AnimalError::MinimalAge unless @person.can_have_swallow?
    raise AnimalError::NoCatAllow if cat_not_allowed
    raise AnimalError::MaxMonthlyCost unless @person.can_have_more_animals?
  end

  def create_animal
    Animal.transaction do
      Animal.create!(@animal_params)
    end
  end

  def cat_not_allowed
    animal_type.cat? && !@person.can_have_cat?
  end

  def animal_type
    @animal_type ||= AnimalType.find_by_id(@animal_params[:animal_type_id])
  end
end
