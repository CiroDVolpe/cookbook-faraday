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
		params = {recipe:{ name: "#{@recipe.name}"}}
		response = Faraday.post('http://localhost:3000/api/v1/recipes', params)

		flash[:status] = response.status
		flash[:body] = response.body

		redirect_to new_recipe_path
	end

end
