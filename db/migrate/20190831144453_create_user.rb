class CreateUser < ActiveRecord::Migration
#purpose of migration is to build a database and its database structure and instructs activerecord and sqlite 
  #the table, its columns, and its datatypes 
  def change
    create_table :users do |t|
    t.string :name
    t.string :username
    t.string :password_digest 
    
    t.timestamps null: false
    end
  end
end
#allows us to encrypt the passwords AND you need to call on a macro on the user 