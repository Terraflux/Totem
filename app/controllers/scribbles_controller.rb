class ScribblesController < ApplicationController

	before_action :require_sign_in

	def create
		@inscription = Inscription.find(params[:inscription_id])
		@scribble = Scribble.new(scribble_params)
		@scribble.alias = current_alias
		@new_scribble = Scribble.new
		if @scribble.save
			flash[:notice] = "Scribble Created"
		else
			flash[:error] = "Creation Error"
		end

		respond_to do |format|
			format.html
			format.js
		end
	end

	def destroy
		@inscription = Inscription.find(params[:inscription_id])
		@scribble = Scribble.find(params[:id])
		if @scribble.destroy
			flash[:notice] = "Scribble Destroyed"
		else
			flash[:error] = "Destruction Error"
		end

		respond_to do |format|
			format.html
			format.js
		end
	end


	private

	def scribble_params
		params.require(:scribble).permit(:body)
	end

end
