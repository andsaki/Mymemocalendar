Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ## postsという一覧画面（index）、詳細画面（show）、
  #  登録画面（new）、登録処理（create）、編集画面（edit）、
  #  更新処理（update）、削除処理（destroy）へのURLを自動発行
  resources :posts do
    # postレコードに関連づけられたComment機能のルーティング
    resources :comments
  end

  #ルート（/）にアクセスしたらpostsコントローラーのindexメソッド実行する
  root :to => 'posts#index'
  
  
  
  
  get 'events/index'
  get 'events/new'
  
  get 'events/:year/:month/:date/edit' => 'events#edit'
  
 

  post 'events' => 'events#create'
  
  get 'events/:num' => 'events#index'
  get 'events/:year/:month/:date' => 'events#show' 
  patch 'events/:year/:month/:date/edit' => 'events#update' 
  put 'events/:year/:month/:date/edit' => 'events#update'

  delete 'events/:year/:month/:date' => 'events#destroy'
  
  
  
  

  


end
