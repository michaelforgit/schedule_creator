class AppointmentsController < ApplicationController
    protect_from_forgery except: :create
    def new
    end
    def create
        date = params["date"].to_date
        start_time = DateTime.new(date.year, date.month, date.day, params["input_start_time(4i)"].to_i, params["input_start_time(5i)"].to_i)
        end_time = start_time + (params[:Appointment][:duration].to_i).minutes
        appointments_at_same_time = Appointment.where("end_time >?", start_time).and(Appointment.where.not("start_time >?", end_time))
        if (appointments_at_same_time.count) == 0
            app = Appointment.create(start_time: start_time, end_time: end_time)
            flash.notice = "Appointment Created #{params[:description]}"
        else
            flash.alert = "Appointment not created it coincided with another time."
        end
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
    def colission_check

    end
end
