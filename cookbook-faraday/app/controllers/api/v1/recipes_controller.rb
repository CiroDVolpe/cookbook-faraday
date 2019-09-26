class Api::V1::RecipesController < Api::V1::ApiController
	def show
		@recipe = Recipe.find(params[:id])
		render json: @recipe, status: 200
	rescue ActiveRecord::RecordNotFound
		render json: 'Não encontrada', status: 404
	end
end