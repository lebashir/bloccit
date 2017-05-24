Rails.application.routes.draw do
  get 'sponsoredposts/show'

  get 'sponsoredposts/new'

  get 'sponsoredposts/edit'

  resources :topics do

    resources :posts, except: [:index]
    resources :sponsoredposts, except: [:index]
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
