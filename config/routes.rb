Rails.application.routes.draw do
  root to: 'tickets#generate'
  get 'tickets/generate'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
