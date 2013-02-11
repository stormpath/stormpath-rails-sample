class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :stormpath_url
      t.datetime :remember_created_at
      t.string :remember_token
      t.timestamps
    end
  end
end
