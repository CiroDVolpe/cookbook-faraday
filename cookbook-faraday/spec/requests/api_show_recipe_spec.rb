require 'rails_helper'

describe 'API show recipe' do
	it 'successfully' do
		recipe = Recipe.create(name: 'Bolo')

		get "/api/v1/recipes/#{recipe.id}"

		json_recipe = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 200
    expect(json_recipe[:name]).to eq recipe.name
	end
	it 'and recipe must exist' do

	get '/api/v1/recipes/1'

	expect(response.status).to eq 404
  expect(response.body).to include('Nao encontrada')
	end
end