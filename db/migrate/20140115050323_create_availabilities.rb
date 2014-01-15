class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
    	t.integer :activity_id, :null => false
    	t.date :date, :null => false
    	t.time :start_time, :null => false
    	t.time :end_time, :null => false
    	#depends on if there are free activites
    	t.float :price, :null => false
    	#need validation for spaces > 0 
    	t.integer :spaces, :null => false

      t.timestamps
    end
    add_index :availabilities, :activity_id
    #need validations for overlapping of times
  end
end
