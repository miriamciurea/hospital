# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "Deleting all appointments..."
Appointment.destroy_all

puts "Deleting all patients..."
Patient.destroy_all

puts "Deleting all users and doctors..."
User.destroy_all

puts "Deleting all specializations..."
Specialization.destroy_all


puts "Seeding the database..."

puts "Creating specializations..."
specializations = Specialization.create([
  { name: 'Cardiology' },
  { name: 'Dermatology' },
  { name: 'Neurology' },
  { name: 'receptionist' }
])

puts "Creating users..."
doctors = User.create([
  { first_name: 'John', last_name: 'Doe', email: 'john@email.com', password: '123456', doctor: true, specialization_id: Specialization.find_by(name:  'Cardiology').id },
  { first_name: 'Jane', last_name: 'Smith', email: 'jane@email.com', password: '123456', doctor: true, specialization_id: Specialization.find_by(name:  'Neurology').id },
])
puts "Creating receptionists..."
receptionists = User.create([
  { first_name: 'Sarah', last_name: 'Smith', email: 'sarah@email.com', password: '123456', doctor: false, specialization_id: Specialization.find_by(name:  'receptionist').id },
  { first_name: 'Charlie', last_name: 'Alice', email: 'charlie@email.com', password: '123456', doctor: false, specialization_id: Specialization.find_by(name:  'receptionist').id }
])

puts "Creating patients..."
patients = Patient.create([
  { first_name: 'Alice', last_name: 'Johnson', problem: 'Headache', address: '123 Main St', telephone: '123-456-7890' },
  { first_name: 'Bob', last_name: 'Williams', problem: 'Pimples', address: '456 Elm St', telephone: '456-789-0123' },
])

puts "Creating appointments..."
10.times do
  Appointment.create(
    user: doctors.sample,
    patient: patients.sample,
    appointment_date: Faker::Time.between(from: DateTime.now, to: 1.month.from_now, format: :default)
  )
end

puts 'Seed data created successfully!'
