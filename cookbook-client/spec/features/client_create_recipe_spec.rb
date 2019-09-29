require 'rails_helper'

feature 'Client create recipe' do
	scenario 'successfully' do

		visit root_path
		fill_in 'Nome', with: 'Bolo'
		click_on 'Enviar'

		expect(page).to have_content('201')
		expect(page).to have_content('Receita Bolo criada com sucesso!')
	end
end