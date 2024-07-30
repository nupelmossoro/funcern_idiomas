class CreateCursos < ActiveRecord::Migration[7.0]
  def change
    create_table :cursos, id: :uuid do |t|
      t.string :idioma
      t.integer :nivel
      t.string :dia
      t.string :turno

      t.timestamps
    end
  end
end
