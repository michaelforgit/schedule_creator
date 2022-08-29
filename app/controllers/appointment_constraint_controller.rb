class AppointmentConstraintController < ApplicationController
  protect_from_forgery except: :create 
  def new
    @daysOfWeek = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
    @appointmentconstraints = AppointmentConstraint.all
  end
  def create
    @daysOfWeek = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
    start_time = DateTime.new(params["appointment_constraint"]["input_start_time(1i)"].to_i, params["appointment_constraint"]["input_start_time(2i)"].to_i, params["appointment_constraint"]["input_start_time(3i)"].to_i, params["appointment_constraint"]["input_start_time(4i)"].to_i, params["appointment_constraint"]["input_start_time(5i)"].to_i)
    end_time = DateTime.new(params["appointment_constraint"]["input_end_time(1i)"].to_i, params["appointment_constraint"]["input_end_time(2i)"].to_i, params["appointment_constraint"]["input_end_time(3i)"].to_i, params["appointment_constraint"]["input_end_time(4i)"].to_i, params["appointment_constraint"]["input_end_time(5i)"].to_i)
    app = AppointmentConstraint.create(day: @daysOfWeek[(params["appointment_constraint"]["value"].to_i)], value: params["appointment_constraint"]["value"], start_time: start_time, end_time: end_time) 
    redirect_to new_appointment_constraint_path
  end
  def edit
    @appointment_constraint = AppointmentConstraint.find(params[:id])  
  end
end
