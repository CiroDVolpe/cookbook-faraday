require 'rails_helper'

feature 'Client view recipe' do
	scenario 'successfully' do

		visit "recipes/1"

		expect(page).to have_content('200')
		expect(page).to have_content('Bolo')
	end

	scenario 'and show message if not found' do

		visit "recipes/88"

		expect(page).to have_content('404')
		expect(page).to have_content('Nao encontrada')
	end
end