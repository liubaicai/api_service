Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'userLogin' => 'users#login'
  post 'userChangePassword' => 'users#changePassword'

  namespace :blog do

    get 'articles/search'
    get 'configs/uptoken'

    resources :configs, except: [:new, :edit]
    resources :links, except: [:new, :edit]
    resources :categories, except: [:new, :edit]
    resources :articles, except: [:new, :edit]
  end

end
