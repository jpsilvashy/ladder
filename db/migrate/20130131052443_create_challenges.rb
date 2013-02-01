class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.belongs_to :tournament, :null => false
      t.belongs_to :challenger, :null => false
      t.belongs_to :defender, :null => false
      t.text :message, :null => false
      t.datetime :expires_at, :null => false

      t.timestamps
    end
    add_index :challenges, :tournament_id
    add_index :challenges, :challenger_id
    add_index :challenges, :defender_id
  end
end
