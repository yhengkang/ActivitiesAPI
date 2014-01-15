class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
    	t.string :activity_name, :null => false
    	t.string :vendor, :null => false
      t.timestamps
    end
  end
end
