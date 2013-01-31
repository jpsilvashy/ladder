class CreateChallengeUsers < ActiveRecord::Migration
  def change
    create_table :challenge_users do |t|
      t.belongs_to :challenge, :null => false
      t.belongs_to :user, :null => false

      t.timestamps
    end
    add_index :challenge_users, :challenge_id
    add_index :challenge_users, :user_id
  end
end
