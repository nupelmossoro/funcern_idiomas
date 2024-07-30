class CreateEnderecos < ActiveRecord::Migration[7.0]
  def change
    create_table :enderecos, id: :uuid do |t|
      t.string :cep
      t.string :logradouro
      t.string :numero
      t.string :bairro
      t.datetime :deleted_at
      t.references :estado, null: false, foreign_key: true, type: :uuid
      t.references :cidade, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
