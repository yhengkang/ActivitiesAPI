class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
    	t.integer :availability_id, :null => false
    	t.integer :guests, :null => false
    	#place holder right now, should be :null => false later on
    	t.integer :user_id
      t.timestamps
    end
    add_index :bookings, :availability_id
  end
end
