Rails.application.routes.draw do
  get'/',to:'schedules#index'
  get'new',to:'schedules#new'
  post'new',to:'schedules#create'
  post'update',to:'schedules#update'
  
   resources:schedules
end