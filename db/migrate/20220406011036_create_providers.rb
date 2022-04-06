class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.integer :external_id, null: false, index: { unique: true }
      t.string  :details

      t.timestamps
    end
  end
end
