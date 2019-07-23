class CreateAnimal < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name, null: false
      t.float :monthly_cost, null: false
      t.references :animal_type, index: true, null: false, foreign_key: true
      t.references :person, index:true,  null: false, foreign_key: true

      t.timestamp
    end
  end
end
