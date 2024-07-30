class AddMonetizeValotToCurso < ActiveRecord::Migration[7.0]
  def change
    add_monetize :cursos, :valor
  end
end
