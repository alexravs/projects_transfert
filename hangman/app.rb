require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/player')
require('./lib/game')
set :bind, '0.0.0.0'

get("/") do
  testW = Word.new
    @test = Game.new(testW)
    @test.save()
    @word_to_find=@test.word()
  @body_parts = {
      :part_1 => " ",
      :part_2 => " ",
      :part_3 => " ",
      :part_4  => " ",
      :part_5  => " ",
      :part_6  => "   ",
      :part_7  => "   ", 
      :part_8  => " ",
      :part_9  => " ",
      :part_10  => " ",
      :part_11  => " ",
      :part_12  => " ",
      :part_13  => " "
    }
    @chances_left = @test.bet()
    if @chances_left.<=(6)
      body_parts[:part_1] = "/"
      body_parts[:part_2] = "\""
      body_parts[:part_3] = '\''
      body_parts[:part_4] = "/"
    elseif @chances_left.<=(5)
      body_parts[:part_5] = "|"
    elseif @chances_left.<=(4) 
      body_parts[:part_6] = "---"
    elseif @chances_left.<=(3)
      body_parts[:part_7] = "---"
    elseif @chances_left.<=(2)
      body_parts[:part_8] = "|"
      body_parts[:part_9] = "|"
    elseif @chances_left.<=(1)
      body_parts[:part_10] = "/"
      body_parts[:part_11] = "/"
     elseif @chances_left.==(0)
      body_parts[:part_12] = '\''
      body_parts[:part_13] = '\''
    end
    testW = Word.new
    @test = Game.new(testW)
    @test.save()
    @word_to_find=@test.word()
    
    @word_revelation = @test.revealed()
    erb(:index)
end

post("/insertion") do
  @test = Game.find(params.fetch("game_id"))
    
    letter = params.fetch("letter")
    #testW = Word.new
    #test = Game.new(testW)
    @word_to_find=@test.word()
    @test.evolve_bet(@test.analyze(letter))
    @chances_left = @test.bet()
    @word_revelation =@test.revealed()
  @body_parts = {
      :part_1 => " ",
      :part_2 => " ",
      :part_3 => " ",
      :part_4  => " ",
      :part_5  => " ",
      :part_6  => "   ",
      :part_7  => "    ", 
      :part_8  => " ",
      :part_9  => " ",
      :part_10  => " ",
      :part_11  => " ",
      :part_12  => " ",
      :part_13  => " "
    }
    if @chances_left.<=(6)
      @body_parts[:part_1] = "/"
      @body_parts[:part_2] = '\\'
      @body_parts[:part_3] = '\\'
      @body_parts[:part_4] = "/"
    end
    if @chances_left.<=(5)
      @body_parts[:part_5] = "|"
    end
    if @chances_left.<=(4) 
      @body_parts[:part_6] = "----"
    end
    if @chances_left.<=(3)
      @body_parts[:part_7] = "---"
    end
    if @chances_left.<=(2)
      @body_parts[:part_8] = "|"
      @body_parts[:part_9] = "|"
    end
    if @chances_left.<=(1)
      @body_parts[:part_10] = "/"
      @body_parts[:part_11] = "/"
    end
    if @chances_left.==(0)
      @body_parts[:part_12] = '\\'
      @body_parts[:part_13] = '\\'
    end
    
    
    erb(:index)
end