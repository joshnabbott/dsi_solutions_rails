class CreateSaveds < ActiveRecord::Migration
  def self.up
    create_table :saveds do |t|
      t.belongs_to :user, :offer
      t.string :saved_type, :text
      t.integer :number
      t.datetime :day_month_year, :health, :auto, :general, :property, :umbrella
      t.boolean :is_deleted, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :saveds
  end
end
