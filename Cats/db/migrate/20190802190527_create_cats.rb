class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false, index: true
      t.string :sex, null: false, limit: 1
      t.string :description, null: false

      t.timestamps
    end
    add_index :cats, [:birth_date, :name] 
  end
end
