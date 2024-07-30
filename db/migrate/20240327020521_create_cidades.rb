class CreateCidades < ActiveRecord::Migration[7.0]
  def change
    create_table :cidades, id: :uuid do |t|
      t.string :nome
      t.references :estado, null: false, foreign_key: true, type: :uuid
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
