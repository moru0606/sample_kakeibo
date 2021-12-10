Rails.application.routes.draw do
  root 'top#index'
  post 'income_values/new(/:name)' => 'income_values#new'
  post "fixedcost_values/new(/:name)" => "fixedcost_values#new"

  resources :incomes
  resources :fixdcosts
  resources :variablecosts
  resources :income_values
end
