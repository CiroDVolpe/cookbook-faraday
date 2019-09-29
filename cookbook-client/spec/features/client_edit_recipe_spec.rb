require 'rails_helper'

feature 'Client edit recipe' do
	scenario 'successfully' do

		visit 'recipes/1'
		click_on 'Editar'
		fill_in 'Nome', with: 'Batata'
		click_on 'Enviar'

		expect(page).to have_content('202')
		expect(page).to have_content('Receita alterada para Batata!')
	end

	scenario 'and show message if not found' do

		visit "recipes/88"

		expect(page).to have_content('404')
		expect(page).to have_content('Nao encontrada')
	end
end