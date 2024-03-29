NasceniaRailsTemplate::Application.routes.draw do
  resources :pension_plans

  resources :insurances

  resources :loans

  resources :debit_cards

  resources :credit_cards

  resources :investment_accounts

  resources :others

  resources :in_home_safe_or_vaults

  resources :safe_deposit_boxes

  resources :artworks

  resources :jewelries

  resources :furnitures

  resources :vehicles

  resources :contacts

  resources :will_and_trusts

  resources :bank_accounts

  resources :financial_accounts

  resources :possessions

  resources :real_estates

  resources :relationships

  #  resources :families, :controller => :relationships
  #  resources :friends, :controller => :relationships

  resources :memorials

  resources :plans do
    member do
      get :download
      get :send_pdf
    end
  end

  resources :profiles do
    member do
      get :edit
      post :update
    end
  end

  resources :medical_instructions do
    collection do
      post 'save_tmp_data'
      get 'save_session_data'
      get 'agreement'
      get 'requirements'
      get 'review'
      post 'agreement_tmp_save'
      post 'requirements_tmp_save'
      post 'review_submit'
    end
  end

  resources :agents

  resources :payments


  devise_for :users, :controllers => {:registrations => "registrations"}

  get "publics/index"
  get "publics/dashboard"
  get "publics/why_my_legacy_plan"
  get "publics/how_it_works"
  
  get "admin/cpanel"
  get "admin/remove_user"




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "publics#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
