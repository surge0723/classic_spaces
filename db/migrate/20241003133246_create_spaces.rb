class CreateSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.string :space
      t.string :place
      t.string :facility
      t.integer:price
      t.integer:payment
      t.string :other
      
      t.timestamps
    end
  end
end
