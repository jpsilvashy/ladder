class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.belongs_to :tournament, :null => false
      t.belongs_to :owner, :null => false
      t.text :message, :null => false

      t.timestamps
    end
    add_index :challenges, :tournament_id
    add_index :challenges, :owner_id
  end
end
