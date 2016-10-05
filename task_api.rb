require 'sinatra'
require_relative 'tasker'
require 'active_record'
require_relative 'environment'

after do
  ActiveRecord::Base.connection.close
end

get '/api/tasks' do
  tasks = Tasker.all
  tasks.to_json
end

post '/api/tasks' do
  user_task = params['user_task']
  task = Tasker.new(user_task: user_task)
  task.save
  task.to_json
end

get '/api/tasks/:id' do
  id = params['id']
  single_task = Tasker.find_by(id: id)
  single_task.to_json
end

put '/api/tasks/:id' do
  id = params['id']
  user_task = params['user_task']
  done_or_nah = params['done_or_nah'] == 'true'

  update_task = Tasker.find_by(id: id)
  update_task.update(user_task: user_task, done_or_nah: done_or_nah)
  update_task.to_json
end

put '/api/tasks/:id/complete' do
  id = params['id']
  done_or_nah = params['done_or_nah']
  true_task = Tasker.find_by(id: id)
  true_task.update(done_or_nah: true)
  true_task.to_json
end

get '/api/tasks/:done_or_nah' do
  done_or_nah = params['done_or_nah']
  single_task = Tasker.find_by(done_or_nah: done_or_nah)
  single_task.to_json
end

delete '/api/tasks/:id' do
  id = params['id']
  user_delete = Tasker.find_by(id: id)
  user_delete.destroy
  nil
end
