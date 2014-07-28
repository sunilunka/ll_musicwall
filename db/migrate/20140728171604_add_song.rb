class AddSong < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :songtitle
      t.string :author
      t.string :url
      t.timestamps
    end

  end
end
