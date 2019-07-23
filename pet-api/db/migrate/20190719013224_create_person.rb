class CreatePerson < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.integer :document, null: false
      t.datetime :birth_date, null: false

      t.timestamp
    end
  end
end
