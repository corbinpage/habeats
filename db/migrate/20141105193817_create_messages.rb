class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :job_id
      t.string  :name
      t.string  :email
      t.string  :telephone
      t.string  :subject
      t.text    :body
      t.string  :location_submitted

      t.timestamps
    end
    add_index :messages, :job_id
  end
end
