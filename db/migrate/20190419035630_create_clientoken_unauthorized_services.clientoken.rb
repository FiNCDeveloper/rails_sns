# This migration comes from clientoken (originally 20190418052745)
class CreateClientokenUnauthorizedServices < ActiveRecord::Migration[5.1]
  def change
    create_table :clientoken_unauthorized_services do |t|
      t.string :application_name,  :null => false
      t.datetime :invalid_until,   :null => false
      t.string :application_token, :null => false

      t.timestamps
    end
    add_index :clientoken_unauthorized_services, :application_name
    add_index :clientoken_unauthorized_services, :application_token
  end
end
