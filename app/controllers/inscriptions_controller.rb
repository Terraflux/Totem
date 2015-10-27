class InscriptionsController < ApplicationController

	def index
		@inscriptions = Inscription.all
	end

	def show
		@inscription = Inscription.find(params[:id])
	end

	def new
		@inscription = Inscription.new
	end

	def create
		@inscription = Inscription.new(inscription_params)
		if @inscription.save
			redirect_to @inscription, notice: "Inscription Created"
		else
			flash[:error] = "Creation Error"
			render :new
		end
	end

	def edit
		@inscription = Inscription.find(params[:id])
	end

	def update
		@inscription = Inscription.find(params[:id])
		@inscription.assign_attributes(inscription_params)
		if @inscription.save
			flash[:notice] = "Inscription Updated"
			redirect_to @inscription
		else
			flash[:error] = "Update Error"
			render :edit
		end
	end

	def destroy
		@inscription = Inscription.find(params[:id])
		if @inscription.destroy
			flash[:notice] = "\#{@inscription.title}\" Destroyed"
			redirect_to action: :index
		else
			flash[:error] = "Destruction Error"
			render :show
		end
	end


	private

	def inscription_params
		params.require(:inscription).permit(:title, :body)
	end

end
