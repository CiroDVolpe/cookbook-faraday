require 'rails_helper'

describe 'API edit recipe' do
	it 'successfully' do
		recipe = Recipe.create(name: 'Bolo')

		patch "/api/v1/recipes/#{recipe.id}", params: { recipe: { name: 'Bolo de cenoura'}}
	
		expect(response.status).to eq 202
    expect(response.body).to include('Receita alterada para Bolo de cenoura!')
	end
	it 'and recipe must exist' do

		patch "/api/v1/recipes/00", params: { recipe: { name: 'Bolo de cenoura'}}	

		expect(response.status).to eq 404
  	expect(response.body).to include('Não encontrada')
	end
end