class SessionsController < ApplicationController
	def create
		user = User.find_by_email(params[:session][:email])
		binding.pry
    	if user && user.authenticate(params[:session][:password])
      		sign_in user
      		redirect_to user
    	else
      		flash[:error] = 'Invalid email/password combination' # Not quite right!
      		render 'new'
    	end
	end

	def new
		
	end
	
	def destroy
		sign_out
    	redirect_to home_path
	end


end
