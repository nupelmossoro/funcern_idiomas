class AddMonetizeParceladoToCursos < ActiveRecord::Migration[7.0]
  def change
    add_monetize :cursos, :parcelado
  end
end
