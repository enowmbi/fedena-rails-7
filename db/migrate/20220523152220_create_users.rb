class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
        t.string   :username
        t.string   :first_name
        t.string   :last_name
        t.string   :email

        t.boolean  :admin
        t.boolean  :student
        t.boolean  :employee

        t.string   :hashed_password
        t.string   :salt
        t.string   :reset_password_code
        t.datetime :reset_password_code_until
        t.references :school

        t.timestamps
      end
    add_index "users", ["school_id"], :name => "index_users_on_school_id"
    add_index "users", ["username"], :name => "index_users_on_username"
    end
  end
