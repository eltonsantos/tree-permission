class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.boolean :active
      t.integer :manager_id

      t.timestamps null: false
    end
  end
end
