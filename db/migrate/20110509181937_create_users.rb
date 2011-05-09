class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.belongs_to :distributor
      t.integer :logins
      t.string :username, :password, :name_first, :name_last, :company, :annual_volume, :address, :city, :state, :zip_code, :phone_office, :phone_cell, :fax, :website, :new
      t.datetime :signed_up, :last_login
      t.boolean :is_admin, :is_updated, :is_active, :is_deleted

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
