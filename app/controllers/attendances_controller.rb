class AttendancesController < ApplicationController
    # create a user attendance
    def create
        @attendance = @current_user.attendances.new(attendance_params)
        if !@attendance.save
            flash[:notice] = @attendance.errors.full_messages.to_sentence
        end
        redirect_to event_path(@attendance.event.ticket_id)
    end

    # destroy a user attendance
    def destroy
        @attendance = @current_user.attendances.find(params[:id])
        event = @attendance.event
        @attendance.destroy
        redirect_to event_path(@attendance.event.ticket_id)
    end

    # attaching the event id to the params of attendance
    private

    def attendance_params
        params.require(:attendance).permit(:event_id)
    end
end