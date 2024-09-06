class AddCidadeToInscricoes < ActiveRecord::Migration[7.0]
  def change
    add_reference :inscricoes, :cidade, foreign_key: true, type: :uuid
  end
end
