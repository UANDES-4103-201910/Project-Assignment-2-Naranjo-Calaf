class CreateDumpsters < ActiveRecord::Migration[5.2]
  def change
    create_table :dumpsters do |t|
      t.references :post, foreign_key: true
      t.datetime :date,       default: DateTime.now

      t.timestamps
    end
  end
end
