Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  #トップページへのルーティング
  root to: 'toppages#index'

  #アカウント新規作成ページへ
  get 'signup', to: 'users#new'
  
  #ログイン処理
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #ユーザ認証用のルーティング(index:一覧表示、show:詳細表示、new:新規ページ、create：DBへの新規登録処理)
  resources :users, only: [:index, :show, :new, :create]

=begin
  # CRUD
  get 'tasks/:id', to: 'tasks#show'
  post 'tasks', to: 'tasks#create'
  put 'tasks/:id', to: 'tasks#update'
  delete 'tasks/:id', to: 'tasks#destroy'

  # index: show の補助ページ
  get 'tasks', to: 'tasks#index'

  # new: 新規作成用のフォームページ
  get 'tasks/new', to: 'tasks#new'

  # edit: 更新用のフォームページ
  get 'tasks/:id/edit', to: 'tasks#edit'
=end

end
