class AddIndexToRedirects < ActiveRecord::Migration[6.1]
  def change
    add_index :redirects, :source, unique: true
    add_index :redirects, :target, unique: true
  end
end
