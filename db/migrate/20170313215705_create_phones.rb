class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :homephone
      t.string :cellphone
      t.string :workphone

      t.timestamps null: false
    end
  end
end
