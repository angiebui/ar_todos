class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :completed
      t.timestamps
    end

      create_table :lists do |t|
      t.string :name
      t.timestamps
    end

    create_table :list_tasks do |t|
      t.integer :task_id
      t.integer :list_id
      t.integer :position
      t.timestamps
    end
  end
end



# Notes from initial skeleton 
# # Add your own columns here and remove the line below
   # puts "You should define your own migration!"
   # puts "Edit #{File.expand_path(__FILE__)}"
   # puts "Remember to create the associated model in #{APP_ROOT.join('app', 'models')}"
   # puts ""
   # puts "Read more: http://guides.rubyonrails.org/migrations.html"
   # exit