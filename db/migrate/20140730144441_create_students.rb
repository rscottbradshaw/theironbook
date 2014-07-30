class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.string :cohort
      t.string :imgUrl

      t.timestamps
    end
  end
end
