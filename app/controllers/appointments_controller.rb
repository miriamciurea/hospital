class AppointmentsController < ApplicationController
before_action :set_user_and_patient, only: [:new, :create]

  def index
    # Example code to find user and patient
    @user = current_user # Assuming you have a current_user method to get the logged-in user
    # @patient = Patient.find(params[:patient_id]) # Example: Finding a patient by its ID
    # @appointments = @patient.appointments # Assuming you want to fetch appointments for this patient
  end

  def new
    # p "tel me you see meeeeeeeeeeeee"
    # @appointment = @patient.appointments.build
    @appointment = Appointment.new
    @patients = Patient.all
    @specializations = Specialization.all
    @doctors = User.where(doctor: true)
    @user = User.new
    @patient = Patient.new
    # @appointment = Appointment.new
    # @patient = Patient.new
    # @user = current_user
    # p @user.id
    # You may want to preload patients for the doctor
    # @patients = Patient.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def create
    p "are you working?????????????????????"
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment created successfully.'
    else
      p @appointment.errors.full_messages
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :patient_id, :user_id)
  end

  def set_user_and_patient
    # @user = User.find(params[:user_id])
    # @patient = Patient.find(params[:patient_id])
    @user = current_user
    @patient = Patient.find(params[:patient_id])
  end

end
