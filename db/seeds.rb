# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Define an array of specialization names
p "Deleting all specializations..."
Specialization.destroy_all
p "Seeding the database..."
specialization_names = ['receptionist', 'general practitioner', 'cardiologist', 'dermatologist', 'pediatrician']

# Create specializations
specialization_names.each do |name|
  Specialization.find_or_create_by(name: name)
end
