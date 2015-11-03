class SessionsController < ApplicationController
	def new
	end

	def create
		@alias = Alias.find_by(name: params[:session][:name].downcase)

		if @alias
			create_session @alias
			flash[:notice] = "Welcome, #{@alias.name}"
			redirect_to root_path
		else
			flash[:error] = "Alias does not exist"
			render :new
		end
	end

	def destroy
		destroy_session(current_alias)
		flash[:notice] = "Alias signed out"
		redirect_to root_path
	end
end
