class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    # You may want to preload patients for the doctor
    @patients = Patient.all
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment created successfully.'
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :patient_id).merge(user_id: current_user.id)
  end
end
