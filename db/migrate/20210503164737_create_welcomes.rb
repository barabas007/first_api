class CreateWelcomes < ActiveRecord::Migration[6.0]
  def change
    create_table :welcomes do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
