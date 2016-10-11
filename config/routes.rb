Rails.application.routes.draw do
    
  get 'segmentation_workspace', to: 'segmentation_workspace#index'
  get 'segmentation_workspace/:id/run', to: 'segmentation_workspace#run', as: 'segmentation_workspace_run'

  resources :segmentations do
    post 'add-clause', to: 'segmentation_clauses#create'
  end
  resources :segmentation_clauses

  resources :contacts, except: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
