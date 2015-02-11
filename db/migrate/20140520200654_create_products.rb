class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :id_num
      t.string :image_url

      t.timestamps
    end
  end
end
