class CreateSaveds < ActiveRecord::Migration
  def self.up
    create_table :saveds do |t|
      t.belongs_to :user, :offer
      t.string :saved_type, :txt
      t.integer :num
      t.string :dmy, :distributor_health, :distributor_auto, :distributor_general, :distributor_property, :distributor_umbrella
      t.boolean :is_deleted, :null => false, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :saveds
  end
end
