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

	def edit
		@recipe = json_to_recipe()
	end

	def update
		recipe_with_new_name = Recipe.new(params.require(:recipe).permit(:name))
		@recipe = json_to_recipe()
		@recipe.name = recipe_with_new_name.name

		params = {recipe:{ name: "#{@recipe.name}"}}
		response = Faraday.patch("http://localhost:3000/api/v1/recipes/#{@recipe.id}", params)

		flash[:status] = response.status
		flash[:body] = response.body
		
		redirect_to root_path
	end

	def destroy
		response = Faraday.delete("http://localhost:3000/api/v1/recipes/#{params[:id]}")

		flash[:status] = response.status
		flash[:body] = response.body
		
		redirect_to root_path
	end

	private

	def json_to_recipe()
		response = Faraday.get("http://localhost:3000/api/v1/recipes/#{params[:id]}")
		json_body = JSON.parse(response.body, symbolize_names: true)
		@status = response.status
		@body = json_body[:name]
		recipe = Recipe.new(name: json_body[:name], id: params[:id])
	end

end
