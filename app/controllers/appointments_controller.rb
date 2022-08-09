class AppointmentsController < ApplicationController
    def new
    end
    def create
        app = Appointment.create()
        puts "CREATED"
        redirect_to root_path
    end
    def index
        @appointments = Appointment.all
    end
end
