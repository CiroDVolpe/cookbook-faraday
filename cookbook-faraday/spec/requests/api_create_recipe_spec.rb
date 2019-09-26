require 'rails_helper'

describe 'API create recipe' do
	it 'successfully' do

		post '/api/v1/recipes', params: { recipe: { name: 'Bolo de cenoura'}}

		expect(response.status).to eq 201
    expect(response.body).to include('Receita criada com sucesso!')
	end
end