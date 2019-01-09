Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :blog do

    get 'articles/search'
    get 'configs/login'
    get 'configs/uptoken'

    resources :configs, except: [:new, :edit]
    resources :links, except: [:new, :edit]
    resources :categories, except: [:new, :edit]
    resources :articles, except: [:new, :edit]
  end

end
