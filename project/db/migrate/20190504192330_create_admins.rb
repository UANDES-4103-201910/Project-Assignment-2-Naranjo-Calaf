class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.references :user, foreign_key: true, unique:true
      t.references :geofence, foreign_key: true
      t.boolean :super,   default: false

      t.timestamps
    end
  end
end
