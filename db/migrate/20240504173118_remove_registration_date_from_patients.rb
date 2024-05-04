class RemoveRegistrationDateFromPatients < ActiveRecord::Migration[7.1]
  def change
    remove_column :patients, :registration_date, :date
  end
end
