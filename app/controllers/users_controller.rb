class UsersController < ApplicationController

  def show
    @user = current_user
    @specialization = Specialization.find(@user.specialization_id).name
    if @user.doctor

      @appointments = Appointment.where(doctor_id: @user.id)
    end

    # if @user.patient
    #   @appointments = Appointment.where(patient_id: @user.id)
    # end

  end

end
