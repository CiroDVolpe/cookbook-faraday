Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'recipes#new'
	resources :recipes, only: %i[show create new edit update destroy]
end
