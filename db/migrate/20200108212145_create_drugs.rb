class CreateDrugs < ActiveRecord::Migration[5.2]
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :dosage
      t.integer :patient_id
    end
  end
end
