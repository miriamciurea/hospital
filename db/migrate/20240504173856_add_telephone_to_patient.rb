class AddTelephoneToPatient < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :telephone, :string
  end
end
