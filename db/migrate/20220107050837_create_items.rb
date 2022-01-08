class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.string :image_path, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
