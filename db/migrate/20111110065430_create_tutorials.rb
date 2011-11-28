class CreateTutorials < ActiveRecord::Migration
  def self.up
    create_table :tutorials do |t|
      t.column :title, :string
      t.column :description, :text
      t.column :image_url, :string
      t.column :video, :string
      t.column :notes, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :tutorials
  end
end
