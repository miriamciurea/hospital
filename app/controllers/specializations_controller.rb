class SpecializationsController < ApplicationController

  def doctors
    specialization = Specialization.find(params[:specialization_id])
    @doctors = specialization.doctors
    render json: @doctors
  end

end
