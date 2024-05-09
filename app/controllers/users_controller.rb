class UsersController < ApplicationController

  def show
    @user = current_user
    @patient = Patient.new
    @specialization = Specialization.find(@user.specialization_id).name

    if @user.doctor == true
      appointments = Appointment.where(user_id: current_user.id)
      @data = generate_appointments_data(appointments)
      @appointments = appointments.where('appointment_date >= ?', Date.today)
    end
  end

  private

  def generate_appointments_data(appointments)
    appointments_data = appointments.where('appointment_date >= ?', Date.today)
                                   .group_by_day(:appointment_date)
                                   .count

    data = [['Date', 'Number of Appointments']]
    (0..6).each do |offset|
      date = Date.today + offset
      count = appointments_data[date] || 0
      p "Date: #{date}, Count: #{count}"
      data << [date, count]
    end
    data
  end

end
