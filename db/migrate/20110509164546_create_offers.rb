class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.belongs_to :distributor, :parent
      t.string :name
      t.text :description, :body
      t.string :link, :sublink
      t.boolean :is_public, :is_deleted, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
