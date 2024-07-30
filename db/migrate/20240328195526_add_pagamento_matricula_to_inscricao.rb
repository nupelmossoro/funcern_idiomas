class AddPagamentoMatriculaToInscricao < ActiveRecord::Migration[7.0]
  def change
    add_column :inscricoes, :pagamento_matricula, :boolean, default: false
  end
end
