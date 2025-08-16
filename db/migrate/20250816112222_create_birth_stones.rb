class CreateBirthStones < ActiveRecord::Migration[7.2]
  def change
    create_table :birth_stones do |t|
      t.string :month
      t.string :crystal
      t.string :colour
      t.text :origin
      t.text :properties
      t.text :associated_stones
      t.text :extra_details
      t.string :picture

      t.timestamps
    end
  end
end
