require 'rails_helper'

describe 'API destroy recipe' do 
	it 'successfully' do 
		recipe = Recipe.create(name: 'Bolo')

		delete "/api/v1/recipes/#{recipe.id}"

		expect(response.status).to eq 202
    expect(response.body).to include('Receita Bolo deletada!')
	end
	it 'and recipe must exist' do

		delete "/api/v1/recipes/00"

		expect(response.status).to eq 404
  	expect(response.body).to include('Nao encontrada')
	end
end