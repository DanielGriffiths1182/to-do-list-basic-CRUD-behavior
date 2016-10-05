require 'pg'
require 'active_record'

class Tasker < ActiveRecord::Base
  validates :user_task, presence: true
end

  # def initialize
#     @task = options[:task]
#     @id = option[:id]
#     @conn = PG.connect(dbname: 'test')
#   end
#
#   def save
#     if @id == nil
#       result = @conn.exec('INSERT INTO tasks (task) ' \
#         "VALUES ('#{@task}') RETURNING id")
#
#       @id = result[0]['id'].to_i
#     else
#       @conn.exec('UPDATE tasks SET ' \
#     "task = '#{@task}', " \
#     "WHERE id = '#{@id}'")
#     end
#   end
# end
#
# def create_table
#   conn = PG.connect(dbname: 'test')
#   conn.exec('CREATE TABLE IF NOT EXISTS tasks' \
#     '(id SERIAL PRIMARY KEY, task VARCHAR)')


 # create_table
