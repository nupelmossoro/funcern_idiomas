class CreateInscricoes < ActiveRecord::Migration[7.0]
  def change
    create_table :inscricoes, id: :uuid do |t|
      t.string :nome
      t.string :sexo
      t.date :data_nascimento
      t.string :nome_pai
      t.string :nome_mae
      t.string :rg
      t.string :cpf
      t.string :orgao_expedidor
      t.date :data_expedicao
      t.string :celular
      t.string :telefone_residencial
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
