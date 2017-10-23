class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.date :date
      t.string :student1
      t.string :student2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
