class CreatePlacaVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :placa_videos do |t|
      t.string :produto

      t.timestamps
    end
  end
end
