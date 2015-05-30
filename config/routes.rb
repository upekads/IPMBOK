Rails.application.routes.draw do


  resources :tasks

  get 'version/new'

  post 'data_file/create/:project_id/:document_id' => 'data_file#create', :as => 'data_file_create'

  get 'search/index'
  get 'search/search_result'
  post 'search/search_result'


  resources :pmbok_doc_outputs

  resources :pmbok_doc_inputs

  resources :templates


  resources :workflows

  resources :subprocess_groups

  resources :process_groups

  resources :knowledge_areas

  resources :project_documents

  resources :pmbok_docs

  resources :project_teams

  resources :project_roles

  resources :projects

  devise_for :admin_users, ActiveAdmin::Devise.config

  #resources :admin_users

  ActiveAdmin.routes(self)
  resources :roles

  get 'home/index'

 # devise_for :users

  resources :users
  resources :links

  resources :projects do
    resources :project_documents
  end

  resources :projects do
    resources :project_teams
  end

  #### Routed by Pop ############3
  # gem install google-api-client
  get 'upload/new'

  get 'session/new', to: 'session#new', as: 'new_session'

  get '/login', to: 'session#new', as: 'login'
  get '/oauth2callback', to: 'session#create'
  get '/logout', to: 'session#destroy', as: 'logout'
  get '/upload', to: 'upload#new', as: 'upload'
  get '/getFile/:project_id/:document_gid', to: 'upload#getFile', as: 'gitFile'
  get '/getFileHistory/:project_id/:document_gid/:version_id', to: 'upload#getFileHistory', as: 'getFileHistory'
  get '/document_versions/:project_id/:document_id', to: 'version#index', as: 'document_versions'
  get '/recovery/:project_id/:document_id/:version_id', to: 'version#recovery', as: 'document_versions_recovery'

  get 'projects/:id/manage_team' => 'projects#manage_team', as: 'manage_team'
  get 'projects/:id/manage_document' => 'projects#manage_document', as: 'manage_document'
  get 'pmbok_docs/:id/view_templates' => 'pmbok_docs#view_templates'
  get 'pmbok_docs/:id/view_workflow' => 'pmbok_docs#view_workflow', as: 'view_workflow'
  get 'project_documents/:id/assign_create' => 'project_documents#assign_create', as: 'assign_create'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get 'home/users' => 'home#manage_user', as: :manage_user


  patch 'projects/:id/new_manager' => 'projects#new_manager'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
