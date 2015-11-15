class AliasesController < ApplicationController

	def show
		@alias = Alias.find(params[:id])
	end

	def new
		@alias = Alias.new
	end

	def create
		@alias = Alias.new
		@alias.name = params[:alias][:name]
		@alias.ipad = request.ip
		if @alias.save
			flash[:notice] = "Welcome #{@alias.name}"
			create_session(@alias)
			redirect_to root_path
		else
			flash[:error] = "Error creating alias"
			render :new
		end

	end


end
