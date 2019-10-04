Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # Routes that oper'ate on the task collection
    root 'tasks#index'
    get '/tasks', to: 'tasks#index', as: 'tasks'
    get '/tasks/new', to: 'tasks#new', as: 'new_task'
    post '/tasks', to: 'tasks#create'
  
    # Routes that operate on individual tasks
    get '/tasks/:id', to: 'tasks#show', as: 'task'
    get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
    patch '/tasks/:id', to: 'tasks#update'
    delete '/tasks/:id', to: 'tasks#destroy'
end
