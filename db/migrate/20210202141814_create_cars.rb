class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :marca
      t.string :veiculo
      t.integer :ano
      t.string :descricao
      t.boolean :vendido

      t.timestamps
    end
  end
end
