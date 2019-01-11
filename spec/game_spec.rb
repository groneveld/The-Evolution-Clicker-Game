require 'rspec'
require 'ruby2d'
require_relative '../app/bd'
require_relative '../app/button'
require_relative '../app/sprite'
require_relative '../app/bonus'
require_relative '../app/player'
require_relative '../app/game'

describe 'Game inits ->' do
  before { @game = Game.new('spectest') }

  it 'Test game player name' do
    expect(@game.player.name).to eq 'spectest'
  end

  it 'Test game player evolution level' do
    expect(@game.player.evolution_level).to eq 4
  end

  it 'Test game player summary dna' do
    expect(@game.player.summary_dna).to eq 176
  end

  it 'Test game player summary dna required' do
    expect(@game.player.dna_required).to eq 400
  end

  it 'Test game player factor' do
    expect(@game.player.factor).to eq 10
  end

  it 'Test game player name of creature' do
    expect(@game.player.name_of_creature).to eq 'Mollusc'
  end

  it 'Test game player button status' do
    expect(@game.player.evolve_button.status).to eq 'locked'
  end

  it 'Test game player button time' do
    expect(@game.player.evolve_button.time).to eq 0
  end

  it 'Test game player change_name method' do
    @game.player.evolution_level = 5
    @game.player.change_name
    expect(@game.player.name_of_creature).to eq 'Small Fish'
  end

  it 'Test game creature dna per second' do
    expect(@game.creature.dna_per_sec).to eq 0.5
  end

  it 'Test game creature factor' do
    expect(@game.creature.factor).to eq 1
  end

  it 'Test game creature method evolve' do
    @game.creature.evolve(10)
    expect(@game.creature.factor).to eq 2
    expect(@game.creature.dna_per_sec).to eq 2.5
  end

  it 'Test game creature impact on player' do
    @game.creature.impact_on_player(@game.player)
    expect(@game.player.summary_dna).to eq 176.5
  end
end
