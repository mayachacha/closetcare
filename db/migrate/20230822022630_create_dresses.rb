class CreateDresses < ActiveRecord::Migration[7.0]
  def change
    create_table :dresses do |t|
      t.integer   :genre_id     ,null:false
      t.text      :brand 
      t.integer   :size_id      ,null:false
      t.date      :date      
      t.integer   :price   
      t.text      :memo
      t.references :user        ,null: false, foreign_key: true
      t.timestamps
    end
  end
end
