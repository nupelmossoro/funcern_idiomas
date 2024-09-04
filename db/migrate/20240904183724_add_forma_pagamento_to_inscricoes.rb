class AddFormaPagamentoToInscricoes < ActiveRecord::Migration[7.0]
  def change
    add_column :inscricoes, :forma_pagamento, :string
  end
end
