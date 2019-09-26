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

	def update
		@recipe = Recipe.find(params[:id])
		@recipe = Recipe.new(recipe_params)
		message = "Receita alterada para #{@recipe.name}!"
		render json: message, status: 202
	rescue ActiveRecord::RecordNotFound
		render json: 'Não encontrada', status: 404
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		message = "Receita #{@recipe.name} deletada!"
		render json: message, status: 202
	rescue ActiveRecord::RecordNotFound
		render json: 'Não encontrada', status: 404
	end
	
	private

	def recipe_params
		params.require(:recipe).permit(:name)
	end
end
