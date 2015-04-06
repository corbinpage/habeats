class CreateProcedureDetails < ActiveRecord::Migration
  def change
    create_table :procedure_details do |t|
      t.integer :procedure_id
      t.text :indications_text
      t.text :benefits_text
      t.text :risks_text
      t.text :alternatives_text
      t.text :description_text
      t.text :post_op_text

      t.timestamps
    end
  end
end
