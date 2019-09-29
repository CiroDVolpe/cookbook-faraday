require 'rails_helper'

feature 'Client delete recipe' do
	scenario 'successfully' do

		visit 'recipes/1'
		click_on 'Deletar'

		expect(page).to have_content('202')
		expect(page).to have_content('deletada!')
	end

	scenario 'and show message if not found' do

		visit "recipes/88"

		expect(page).to have_content('404')
		expect(page).to have_content('Nao encontrada')
	end
end