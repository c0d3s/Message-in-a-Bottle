class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :handle
      t.string  :password_digest
      t.integer :karma

      t.timestamps
    end
  end
end
