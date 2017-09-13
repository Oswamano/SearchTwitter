class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 	def is_admin
        if current_user and current_user.is_admin?
            return true
        else
            flash[:notice] = "Error: You must be signed in to view this page."
            redirect_to '/landing/index'
        end
  end
  
  def is_user
      if !current_user
          flash[:notice] =  "Error: You must be signed in to view this page."
          redirect_to '/users/sign_in'
      else
          return true
      end
  end
      # Change layout for logging in
      layout :layout
      private
      def layout
          # switch to login layout for logging in if a devise controller is detected
          devise_controller? ? "login" : "application"
      end


end