class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.text :description
      t.integer :year
      t.string :campus
      t.string :class

      t.timestamps
    end
  end
end
