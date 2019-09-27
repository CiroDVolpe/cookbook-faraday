class RecipesController < ApplicationController

	def show 
		response = Faraday.get("http://localhost:3000/api/v1/recipes/#{params[:id]}")
		@status = response.status
		@body = response.body
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(params.require(:recipe).permit(:name))
		response = Faraday.post('http://localhost:3000/api/v1/recipes', "name=Bolo")

		@status = response.status
		@body = response.body
		

		flash[:notice] = response.status
		# flash[:alert] = "#{@body}"

		redirect_to new_recipe_path
	end

end
