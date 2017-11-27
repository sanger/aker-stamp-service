Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      jsonapi_resources :stamps do
        jsonapi_relationships only: [ :show, :get_related_resources ]
        post :set_permissions
        post :apply
        post :unapply
      end
      jsonapi_resources :deputies
      jsonapi_resources :permissions, only: [ :create, :show, :index, :destroy ] do
        jsonapi_relationships only: [ :show, :get_related_resource ]
      end
      jsonapi_resources :materials, only: [ :create, :show, :index, :destroy ] do
        jsonapi_relationships only: [ :show, :get_related_resource ]
      end
      post 'permissions/check', to: 'permissions#check'
      get 'deputies/list_principals/:email', to: 'deputies#list_principals', constraints: { email: /[^\/]+/ }, as: :list_principals
    end
  end
end
