Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "prototypes#index"
  # resources :prototypes   #resoucesの引数にシンボル(prototypes)を指定→prototypesパスに対応するルーティング生成
  # resources :prototypes do   #コメントに紐づくプロトタイプのIDのリクエストのパス
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
  end
  resources :users, only: :show     # resource >>>> resources へ変更  複数形にしないとURLにIDが渡せない

end
