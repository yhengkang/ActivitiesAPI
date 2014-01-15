class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
    	t.integer :activity_id, :null => false
    	t.date :date, :null => false
    	t.time :start_time, :null => false
    	t.time :end_time, :null => false
    	# no need for free activites now do we?
    	t.float :price, :null => false

      t.timestamps
    end
    add_index :availabilities, :activity_id
    #need validations for overlapping of times
  end
end
