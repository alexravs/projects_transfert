require('rspec')
require('ping_pong')

describe('Fixnum#get_range_pingpong') do
  it("counts from 1 to a given number") do
    expect((5).get_range_pingpong()).to(eq([1,2,3,4,5]))
  end
end



describe('Fixnum#convert_num_to_pingpong') do
  it("changes a number divisible by 3 to Pong") do
    expect((3).convert_num_to_pingpong()).to(eq("Ping"))
  end
  
  it("changes a number divisible by 5 to Pong") do
    expect((5).convert_num_to_pingpong()).to(eq("Pong"))
  end
  
  it("changes a number divisible by 3 & 5 to PingPong") do
    expect((15).convert_num_to_pingpong()).to(eq("PingPong"))
  end
  
  it("does not change number non-divisible by 3 or 5") do
    expect((7).convert_num_to_pingpong()).to(eq(7))
  end
end

describe('Fixnum#get_pingpong') do
  it("gives the ping pong array according to a number") do
    expect((10).get_pingpong()).to(eq([1,2,"Ping",4,"Pong","Ping",7,8,"Ping","Pong"]))
  end
end