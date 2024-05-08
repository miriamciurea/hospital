class UsersController < ApplicationController

  def show
    @user = current_user
    @patient = Patient.new
    @specialization = Specialization.find(@user.specialization_id).name
    if @user.doctor
      @appointments = Appointment.where(doctor_id: @user.id)
    end

    if @user.doctor == true
      appointments = Appointment.where(user_id: current_user.id)
      # count = appointments.group_by_day(:appointment_date).count
      @data = [['timeofday', 'number']] + appointments.group_by_day(:appointment_date).count.map { |k, v| [k.to_date, v] }
      respond_to do |format|
        p @data
        format.html
        format.json { render json: @data }
      end
    end

    # if @user.patient
    #   @appointments = Appointment.where(patient_id: @user.id)
    # end

  end

  # def chart_data
  #   appointments = Appointment.where(doctor_id: current_user.id)
  #   # count = appointments.group_by_day(:appointment_date).count
  #   @data = appointments.group_by_day(:appointment_date).count.map { |k, v| [k.to_date, v] }
  #   render json: data
  # end

end
