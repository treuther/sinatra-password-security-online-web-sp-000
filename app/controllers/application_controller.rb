require "./config/environment"
require "./app/models/user"
class ApplicationController < Sinatra::Base

	configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
	end

#renders an index.erb file with links to signup or login
	get "/" do
		erb :index
	end

#renders a form to create a new user. The form includes fields for username and password
	get "/signup" do
		erb :signup
	end

	post "/signup" do
		#your code here!
	end

#renders a form for logging in
	get "/login" do
		erb :login
	end

	post "/login" do
		#your code here!
	end

#renders a success.erb page, which should be displayed once a user successfully
#logs in
	get "/success" do
		if logged_in?
			erb :success
		else
			redirect "/login"
		end
	end

#renders a failure.erb page. This will be accessed if there is an error logging
#in or signing up
	get "/failure" do
		erb :failure
	end

#clears the session data and redirects to the homepage
	get "/logout" do
		session.clear
		redirect "/"
	end

#returns true or false based on the presence of a session[:user_id]
	helpers do
		def logged_in?
			!!session[:user_id]
		end

#returns the instance of the logged in user, based on the session[:user_id]
		def current_user
			User.find(session[:user_id])
		end
	end

end
