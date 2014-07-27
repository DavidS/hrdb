class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # handle current user and session for the view
  helper_method :current_person_session, :current_person

  private
    def current_person_session
      return @current_person_session if defined?(@current_person_session)
      @current_person_session = PersonSession.find
    end

    def current_person
      return @current_person if defined?(@current_person)
      @current_person = current_person_session && current_person_session.user
    end

    def require_person
      unless current_person
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to login_path
        return false
      end
    end

    def require_no_person
      if current_person
        store_location
        flash[:notice] = "You cannot access this page while logged in to another account"
        redirect_to root_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
