class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.references :user
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
