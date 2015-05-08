Rails.application.routes.draw do

  get "movie/:id/mail" => "movies#mail", :as => 'mail_movie'
  get "movie/:id/spam" => "movies#spam", :as => 'spam_movie'
  get 'rental/index'

  #get 'rental/show'
  get 'rental/show/:id' => "rental#show", :as => 'rental_show'
  #get 'page/calendar(/:year(/:month))' => "page#calendar", :as => 'calendar'

  devise_for :users
  #resources :movies
  resources :movies do
    get 'page/:page', :action => :index, :on => :collection
    resources :comments
#    delete 'movies/:id/comments/:comments_id', :controller => :comments, :action => :destroy, :as => "destroy_comment"
  end

  get 'people/index'

  get 'home' => "page#home"

  get 'about_us' => "page#about_us"

  post 'contact_us' => "page#contact_us"
  get 'contact_us' => "page#contact_us"
# match 'contact_us' => "page#contact_us", :via => [:post, :get]



  get 'newsletter' => "page#newsletter"

  get 'blog' => "page#blog"

  get 'page/calendar(/:year(/:month))' => "page#calendar", :as => 'calendar'

  get 'articles' => "page#articles"

  get 'login' => "page#login"

  get 'dave/teach'

  get 'dave/speak'

  get 'dave/dig'

  get 'say/dave' => 'say#hello'
  get 'say/goodbye'
  get 'say/something'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'page#home'

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
