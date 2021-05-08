module ApplicationHelper
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        current_user
    end

    def display_date(itinerary)
        itinerary.date.strftime("%A, %b %e, %Y")
    end

    def display_time(activity)
        activity.time.strftime("%l:%M %p")
    end
end
