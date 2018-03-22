class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.with_options index: { unique: true } do
        t.string :name
        t.string :email
      end
      t.with_options default: false do
        t.boolean :moderator
        t.boolean :creator
        t.boolean :banned
      end

      t.timestamps
    end
  end
end
