


class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.boolean :completed
      t.timestamps
    end

    create_table :lists do |t|
      t.string :name
      t.timestamps
    end

    create_table :task_lists do |t|
      t.integer :task_id
      t.integer :list_id
      t.timestamps
    end
  end
end
