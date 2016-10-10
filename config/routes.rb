Rails.application.routes.draw do
    
  get 'segmentation_workspace/index'

  get 'segmentation_workspace/run'

  resources :segmentations
  resources :segmentation_clauses

  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
