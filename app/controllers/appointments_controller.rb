class AppointmentsController < ApplicationController
    protect_from_forgery except: :create
    def new
    end
    def create
        flash.notice = "Appointment Created #{params[:description]}"
        start_time = DateTime.new(params["input_start_date(1i)"].to_i, params["input_start_date(2i)"].to_i, params["input_start_date(3i)"].to_i, params["input_start_time(4i)"].to_i, params["input_start_time(5i)"].to_i)
        app = Appointment.create(start_time: start_time, end_time: start_time + (params[:Appointment][:duration].to_i).minutes)
        redirect_to root_path
    end
    def index
        @appointments = Appointment.all
    end
    def update
        app = Appointment.find(params[:id])
        time = DateTime.new(params[:appointment]["start_time(1i)"].to_i, params[:appointment]["start_time(2i)"].to_i, params[:appointment]["start_time(3i)"].to_i, params[:appointment]["start_time(4i)"].to_i, params[:appointment]["start_time(5i)"].to_i)
        app.update(start_time: time)
        app.update(end_time: time + 30.minutes)
        redirect_to root_path
    end
    def edit
        @appointment = Appointment.find(params[:id])
    end
end
