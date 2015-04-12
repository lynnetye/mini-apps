class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :content
    end
  end
end
