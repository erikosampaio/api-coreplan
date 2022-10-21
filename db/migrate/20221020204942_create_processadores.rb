class CreateProcessadores < ActiveRecord::Migration[5.2]
  def change
    create_table :processadores do |t|
      t.string :produto
      t.string :marca

      t.timestamps
    end
  end
end
