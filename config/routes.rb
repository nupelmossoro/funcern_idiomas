Rails.application.routes.draw do

  resources :enderecos do
    collection do
      get 'search'
      post 'datatable'
    end
  end
  
  resources :configuracoes

  resources :cidades do
    collection do
      get 'search'
      post 'datatable'
    end
  end

  resources :estados do 
    collection do
      get 'search'
      post 'datatable'
    end
  end
  resources :inscricoes do
    collection do
      get 'search'
      post 'datatable'
    end
    member do
      get 'recibo'
    end
  end

  resources :cursos do
    collection do
      get 'search'
      post 'datatable'
    end
  end

  devise_for :usuarios, controllers: { sessions: 'usuarios/sessions', registrations: 'usuarios/registrations' }
  
  resources :usuarios, skip: [:sessions, :registrations]

  resources :audits, only: :show
  match '500', :to => 'errors#internal_server_error', :via => :all
  match '422', :to => 'errors#unacceptable', :via => :all
  match '404', :to => 'errors#not_found', :via => :all
  RESPOND_404.map { |r2|  get "/#{r2}", to: redirect("/404") }
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
