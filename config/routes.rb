Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #トップページへのルーティング
  root to: 'tasks#index'

  #7つのルーティング設定の省略形(show,create,update,destroy,index,new,edit) 
  resources :tasks

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
