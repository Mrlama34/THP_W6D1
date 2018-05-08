class EventsController < ApplicationController
	def new
	@event = Event.new
	end

	def create
		if user_signed_in?
			@current_user = current_user
			@event = Event.new(params_event)
			@event.creator_id = @current_user.id
			@event.save
			if @event.save
				redirect_to event_path(@event.id)
			else 
				flash.now[:danger] = "Erreur dans la création de votre evenement"
				render new
			end
		else
			redirect_to new_user_session_path
		end


	end

	def index
		@events = Event.all
	end

	def show
		@event = Event.find_by(id: params[:id])

	end

	def subscribe
		if user_signed_in?
			attendee_id = @current_user.id
			flash[:success] = "Inscription réussie !"
			redirect_to events_path
		end


	end
private

def params_event
	params.require(:event).permit(:description, :date, :place)
end
end
