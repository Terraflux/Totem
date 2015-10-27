class ScribblesController < ApplicationController

	def index
		@scribbles = Scribble.all
	end

	def show
		@scribble = Scribble.find(params[:id])
	end

	def new
		@scribble = Scribble.new
	end

	def create
		@scribble = Scribble.new(scribble_params)
		if @scribble.save
			redirect_to @scribble, notice: "Scribble Created"
		else
			flash[:error] = "Creation Error"
			render :new
		end
	end

	def edit
		@scribble = Scribble.find(params[:id])
	end

	def update
		@scribble = Scribble.find(params[:id])
		@scribble.assign_attributes(scribble_params)
		if @scribble.save
			flash[:notice] = "Scribble Updated"
			redirect_to @scribble
		else
			flash[:error] = "Update Error"
			render :edit
		end
	end

	def destroy
		@scribble = Scribble.find(params[:id])
		if @scribble.destroy
			flash[:notice] = "\#{@scribble.title}\" Destroyed"
			redirect_to action: :index
		else
			flash[:error] = "Destruction Error"
			render :show
		end
	end


	private

	def scribble_params
		params.require(:scribble).permit(:title, :body)
	end

end
