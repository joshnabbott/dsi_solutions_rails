class CreateDistributors < ActiveRecord::Migration
  def self.up
    create_table :distributors do |t|
      t.string :name, :initials, :logo, :interests, :tac
      t.text :description, :terms
      t.boolean :is_deleted, :null => false, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :distributors
  end
end
