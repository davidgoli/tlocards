Tlocards::Application.routes.draw do
  devise_for :users

  resources :downloads do
    resources :codes
  end

  match 'code/:code' => 'codes#show', :as => 'download_code'
  match 'do_redeem' => 'codes#do_redeem', :as => 'do_redeem_download_code'
  match 'code/:code/attachment' => 'codes#attachment', :as => 'download_attachment'
  match 'download/:download_id/attachment' => 'codes#attachment', :as => 'download_direct_attachment'

  match 'admin' => 'welcome#index', :as => 'admin'

  root :to => 'codes#redeem'
end
