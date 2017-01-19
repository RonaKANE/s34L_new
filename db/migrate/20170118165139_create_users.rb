class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :first_name
      t.string :last_name
      t.string :service
      t.string :user_tel
      t.string :user_mail
      t.string :office
      t.text :certificate_name
      t.text :password

      t.timestamps
    end
  end
end
