class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.references :company, foreign_key: true

      t.string :first_name
      t.string :last_name
      t.date :birthday

      t.string :location
      t.string :email
      t.string :phone
      t.string :website

      t.string :twitter
      t.string :linkedin
      t.string :github

      t.timestamps
    end
  end
end
