require 'rspec'
require_relative '../app/bd'

describe 'DB Init ->' do
  before { @db = DataBase.new }

  it 'Test getting "cell" creature' do
    expect(@db.creatures[1]).to eq 'Cell'
  end

  it 'Test getting "Amoeba" creature' do
    expect(@db.creatures[2]).to eq 'Amoeba'
  end

  it 'Test getting "Worm" creature' do
    expect(@db.creatures[3]).to eq 'Worm'
  end

  it 'Test getting "Mollusc" creature' do
    expect(@db.creatures[4]).to eq 'Mollusc'
  end

  it 'Test getting "Small Fish" creature' do
    expect(@db.creatures[5]).to eq 'Small Fish'
  end

  it 'Test getting "Crab" creature' do
    expect(@db.creatures[6]).to eq 'Crab'
  end

  it 'Test getting "Scorpio" creature' do
    expect(@db.creatures[7]).to eq 'Scorpio'
  end

  it 'Test getting "Lizard" creature' do
    expect(@db.creatures[8]).to eq 'Lizard'
  end

  it 'Test getting "Turtle" creature' do
    expect(@db.creatures[9]).to eq 'Turtle'
  end

  it 'Test getting "Lystosaurus" creature' do
    expect(@db.creatures[10]).to eq 'Lystosaurus'
  end

  it 'Test getting "Mouse" creature' do
    expect(@db.creatures[11]).to eq 'Mouse'
  end

  it 'Test getting "Squirrel" creature' do
    expect(@db.creatures[12]).to eq 'Squirrel'
  end

  it 'Test getting "Hare" creature' do
    expect(@db.creatures[13]).to eq 'Hare'
  end

  it 'Test getting "Sloth" creature' do
    expect(@db.creatures[14]).to eq 'Sloth'
  end

  it 'Test getting "Plesiadapis" creature' do
    expect(@db.creatures[15]).to eq 'Plesiadapis'
  end

  it 'Test getting "Monkey" creature' do
    expect(@db.creatures[16]).to eq 'Monkey'
  end

  it 'Test getting "Gorilla" creature' do
    expect(@db.creatures[17]).to eq 'Gorilla'
  end

  it 'Test getting "Australopithecus" creature' do
    expect(@db.creatures[18]).to eq 'Australopithecus'
  end

  it 'Test getting "Neanderthal" creature' do
    expect(@db.creatures[19]).to eq 'Neanderthal'
  end

  it 'Test getting "Human" creature' do
    expect(@db.creatures[20]).to eq 'Human'
  end

  it 'Test getting "Alien" creature' do
    expect(@db.creatures[21]).to eq 'Alien'
  end

  it 'Test getting "Robot" creature' do
    expect(@db.creatures[22]).to eq 'Robot'
  end

  it 'Test getting "Megabrain" creature' do
    expect(@db.creatures[23]).to eq 'Megabrain'
  end

  it 'Test custom init model' do
    #@valera = Model.new(10, 20, 30, 4, 50, 60, 70)
    #expect(@valera.health).to eq 10
  end
end