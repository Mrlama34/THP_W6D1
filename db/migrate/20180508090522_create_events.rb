class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
    	t.text :description
    	t.string :place
    	t.datetime :date
    	t.belongs_to :creator
    	


      t.timestamps
    end
  end
end
