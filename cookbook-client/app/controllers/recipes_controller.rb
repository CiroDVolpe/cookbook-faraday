class RecipesController < ApplicationController

	def show 
		response = Faraday.get("http://localhost:3000/api/v1/recipes/#{params[:id]}")
		@status = response.status
		@body = response.body
	end

end
