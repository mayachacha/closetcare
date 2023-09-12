class CreateMylists < ActiveRecord::Migration[7.0]
  def change
    create_table :mylists do |t|
      t.references :user        ,null: false, foreign_key: true
      t.references :dress        ,null: false, foreign_key: true
      t.timestamps
    end
  end
end
