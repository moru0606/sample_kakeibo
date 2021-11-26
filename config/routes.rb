Rails.application.routes.draw do
  root 'top#index'
  post "income_values/new(/:name)" => "income_values#new"

  resources :incomes
  resources :fixdcosts
  resources :variablecosts
  resources :income_values
end
