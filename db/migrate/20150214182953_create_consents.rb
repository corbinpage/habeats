class CreateConsents < ActiveRecord::Migration
  def change
    create_table :consents do |t|
      t.integer :user_id
      t.integer :procedure_id
      t.boolean :indications_complete, :default => false
      t.boolean :benefits_complete, :default => false
      t.boolean :risks_complete, :default => false
      t.boolean :alternatives_complete, :default => false
      t.boolean :description_complete, :default => false
      t.boolean :consent_complete, :default => false

      t.timestamps
    end
  end
end
