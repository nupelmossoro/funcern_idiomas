class AddProfessorToCurso < ActiveRecord::Migration[7.0]
  def change
    add_column :cursos, :professor, :string
  end
end
