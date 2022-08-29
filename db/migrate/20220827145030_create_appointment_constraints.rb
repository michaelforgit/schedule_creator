class CreateAppointmentConstraints < ActiveRecord::Migration[7.0]
  def change
    create_table :appointment_constraints do |t|
      t.string :day
      t.datetime :start_time
      t.datetime :end_time
      t.integer :value
      t.timestamps
    end
  end
end
