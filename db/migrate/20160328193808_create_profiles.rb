class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :manager_id
      t.integer :agent_id
      t.boolean :active, default: true
      t.string :description

      t.timestamps null: false
    end
  end
end
