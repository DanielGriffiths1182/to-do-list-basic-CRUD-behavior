require_relative 'environment'
require "active_record"

class CreateTaskerTable < ActiveRecord::Migration[5.0]

  def up
    create_table :taskers do |t|
      t.string :user_task
      t.boolean :done_or_nah, default: false
    end
  end

  def down
    drop_table :taskers
  end

end

def main
  action = (ARGV[0] || :up).to_sym

  CreateTaskerTable.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
