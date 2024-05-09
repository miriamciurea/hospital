class AppointmentsController < ApplicationController
  before_action :set_user_and_patient, only: [:new, :create, :edit, :update]

  def index
    # Example code to find user and patient
    @user = current_user # Assuming you have a current_user method to get the logged-in user
    # @patient = Patient.find(params[:patient_id]) # Example: Finding a patient by its ID
    # @appointments = @patient.appointments # Assuming you want to fetch appointments for this patient
    @appointments = Appointment.all
  end

  def new
    # @appointment = @patient.appointments.build
    @appointment = Appointment.new
    @patients = Patient.all
    @specializations = Specialization.all
    @doctors = User.where(doctor: true)
    @user = User.new
    @patient = Patient.new
    # binding.pry
    # @appointment = Appointment.new
    # @patient = Patient.new
    # @user = current_user
    # p @user.id
    # You may want to preload patients for the doctor
    # @patients = Patient.all
  end

  def create
    # p "tel me you see meeeeeeeeeeeee"
    # @appointment = Appointment.new(appointment_params)
    # if @appointment.save
    #   redirect_to appointments_path, notice: 'Appointment created successfully.'
    # else
    #   p @appointment.errors.full_messages
    #   render :new
    # end
    p "tel me you see meeeeeeeeeeeee"
    # Parse the appointment_date attribute into a DateTime object
    appointment_date = DateTime.parse(appointment_params[:appointment_date])

    # Create a new appointment with the parsed appointment_date
    @appointment = Appointment.new(appointment_params.merge(appointment_date: appointment_date))

    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment created successfully.'
    else
      p @appointment.errors.full_messages
          binding.pry
      render :new
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end


  def edit
    @appointment = Appointment.find(params[:id])
    @doctors = User.where(doctor: true)
    @patients = Patient.all
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      # redirect_to user_patient_appointment_path(user_id: @user.id, patient_id: @patient.id, id: @appointment.id), notice: 'Appointment updated successfully.'
      redirect_to appointments_path, notice: 'Appointment updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path, notice: 'Appointment deleted successfully.'
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
