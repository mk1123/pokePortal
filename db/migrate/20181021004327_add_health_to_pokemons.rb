class AddHealthToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :health, :integer
  end
end
