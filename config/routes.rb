Rails.application.routes.draw do

  namespace :api, path: '/', constraints: { subdomain: 'api' } do
  	
  	  post '/user/create',     to: 'users#create'
      get  '/user/orders',     to: 'users#orders'

      get '/products/view',    to: 'products#index'
      post '/products/create', to: 'products#create'

      post '/order/create',    to: 'orders#create'
      get '/order/view',       to: 'orders#show'
      put '/order/delivered',  to: 'orders#delivered'
      put '/order/update',     to: 'orders#update'

      put '/payment/received',to: 'payments#received'
      put '/payment/refund',  to: 'payments#refund'
  	
  end

end
