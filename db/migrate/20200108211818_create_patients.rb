class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :condition
      t.integer :user_id
      t.integer :disease_id
    end
  end
end
