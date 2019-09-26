class Api::V1::RecipesController < Api::V1::ApiController
	def show
		@recipe = Recipe.find(params[:id])
		render json: @recipe, status: 200
	rescue ActiveRecord::RecordNotFound
		render json: 'Não encontrada', status: 404
	end

	def create
    @recipe = Recipe.new(recipe_params)
  	@recipe.save
    render json: 'Receita criada com sucesso!', status: 201
	end
	
	private

	def recipe_params
		params.require(:recipe).permit(:name)
	end
end
