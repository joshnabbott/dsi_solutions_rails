class CreateInterests < ActiveRecord::Migration
  def self.up
    create_table :interests do |t|
      t.belongs_to :user, :offer
      t.string :response
      t.boolean :is_deleted, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :interests
  end
end
