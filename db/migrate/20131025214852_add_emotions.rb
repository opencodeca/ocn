class AddEmotions < ActiveRecord::Migration
  def up
    create_table :emotions do |t|
      # The emotional model
      t.references :emotional, polymorphic: true

      # The emotive model
      t.references :emotive, polymorphic: true

      # The type of emotion
      t.string :emotion

      t.timestamps
    end

    add_index :emotions, [:emotional_type, :emotional_id, :emotive_type, :emotive_id, :emotion], unique: true, name: 'index_emotions_by_emotional_emotive_and_emotion'
    add_index :emotions, [:emotional_type, :emotional_id, :emotive_type, :emotive_id], name: 'index_emotions_by_emotional_and_emotive'
    add_index :emotions, [:emotive_type, :emotive_id, :emotion], name: 'index_emotions_by_emotive'
  end

  def down
    drop_table :emotions
  end
end
