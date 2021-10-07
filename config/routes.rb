Rails.application.routes.draw do
  root 'top#index'

  resources :incomes
  resources :fixdcosts
  resources :variablecosts
  resources :income_values
end
