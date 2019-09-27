require 'rails_helper'

describe 'API create recipe' do
	it 'successfully' do

		post '/api/v1/recipes', params: { recipe: { name: 'Bolo'}}

		expect(response.status).to eq 201
    expect(response.body).to include('Receita Bolo criada com sucesso!')
	end
end