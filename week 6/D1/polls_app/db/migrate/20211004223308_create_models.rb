class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, unique: true, null: false
      t.timestamps
    end

    create_table :polls do |t|
      t.string :title, null: false
      t.index :user_id, null: false
      t.timestamps
    end

    create_table :questions do |t|
      t.text :body, null: false
      t.index :poll_id, null: false
      t.timestamps
    end

    create_table :answer_choices do |t|
      t.text :choice, null: false
      t.index :question_id, null: false
      t.timestamps
    end

    create_table :responses do |t|
      t.index :user_id, null: false
      t.index :answer_choice_id
      t.timestamps
    end
  end
end
