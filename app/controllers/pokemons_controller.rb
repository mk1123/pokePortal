class PokemonsController < ApplicationController

  def capture
    @curr_pokemon = Pokemon.find(params[:id])
    @curr_pokemon.trainer = current_trainer

    @curr_pokemon.save

    redirect_to '/'
  end

  def damage
    @curr_pokemon = Pokemon.find(params[:id])
    old_health = @curr_pokemon.health
    @curr_pokemon.health = old_health - 10
    @curr_pokemon.save

    if @curr_pokemon.health <= 0
      @curr_pokemon.destroy
    end

    redirect_to trainer_path(id: @curr_pokemon.trainer.id)
  end

  def new
    @pokemon = Pokemon.new
  end

  def create

    curr_hash = params[:pokemon]
    curr_name = curr_hash[:name]
    curr_ndex = curr_hash[:ndex]
    curr_level = 1
    curr_health = 100

    new_pokemon = Pokemon.create(name: curr_name, ndex: curr_ndex, level: curr_level, health: curr_health, trainer: current_trainer)

    if new_pokemon.valid?
      new_pokemon.save
      redirect_to trainer_path(id: current_trainer.id)
    else
      flash[:error] = new_pokemon.errors.full_messages.to_sentence
      redirect_to new_pokemon_path
    end

    
  end

end