class AppointmentsController < ApplicationController
    protect_from_forgery except: :create
    def new
    end
    def create
        flash.notice = "Appointment Created"
        start_time = params[:start_time]
        end_time = params[:end_time]
        app = Appointment.create(start_time: start_time, end_time: end_time)
        redirect_to root_path
    end
    def index
        @appointments = Appointment.all
    end
    def edit
    end
end
