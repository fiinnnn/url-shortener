class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :source
      t.string :target

      t.timestamps
    end
    add_index :links, :source, unique: true
  end
end
