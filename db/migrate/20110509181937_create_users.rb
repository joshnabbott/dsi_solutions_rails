class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.belongs_to :distributor
      t.integer :logins
      t.string :username, :password, :name_first, :name_last, :company, :annual_volume, :address, :city, :state, :zip_code, :phone_office, :phone_cell, :fax, :website, :new
      t.datetime :signed_up, :last_login
      t.boolean :is_admin, :is_updated, :is_active, :is_deleted, :default => false

      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.timestamps
    end
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
