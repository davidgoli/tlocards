Tlocards::Application.routes.draw do
  devise_for :users

  resources :downloads do
    resources :codes
  end

  resources :codes, only: [:get]

  post 'do_redeem' => 'codes#do_redeem', :as => 'do_redeem_download_code'
  get 'code/:code/attachment' => 'codes#attachment', :as => 'download_attachment'
  get 'download/:download_id/attachment' => 'codes#attachment', :as => 'download_direct_attachment'

  get 'admin' => 'welcome#index', :as => 'admin'

  root :to => 'codes#redeem'
end
