class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|

      t.integer :user_id, :null => false
      t.string  :provider, :null => false
      t.string  :uid, :null => false
      t.string  :auth_token

      t.timestamps
    end
  end
end
