class CreateRedirects < ActiveRecord::Migration[6.1]
  def change
    create_table :redirects do |t|
      t.string :source
      t.string :target

      t.timestamps
    end
  end
end
