class AddMailgunAttrToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :mailgun_id, :string
    add_column :messages, :mailgun_reply_to_id, :string
    add_column :messages, :mailgun_response, :string
    add_index  :messages, :mailgun_id
    add_index  :messages, :mailgun_reply_to_id
  end
end
