class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.belongs_to :imageable, polymorphic: true
      t.string :file

      t.timestamps
    end
    add_index :images, :imageable_id
  end
end