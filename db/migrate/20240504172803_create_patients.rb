class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.text :problem
      t.string :first_name
      t.string :last_name
      t.text :address
      t.date :registration_date

      t.timestamps
    end
  end
end
