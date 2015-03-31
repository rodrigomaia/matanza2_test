class CreateNota < ActiveRecord::Migration
  def change
    create_table :nota do |t|

      t.timestamps null: false
    end
  end
end
