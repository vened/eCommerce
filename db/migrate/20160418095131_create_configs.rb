class CreateConfigs < ActiveRecord::Migration
  def change
    create_table :configs do |t|
      t.string :sitename
      t.boolean :google_analytics
      t.string :google_analytics_counter_id
      t.text :scripts

      t.timestamps null: false
    end
  end
end
