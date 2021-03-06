class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :position
      t.string :email
      t.timestamps
      t.references :company, index: true, foreign_key: true
    end
  end
end
