require('rspec')
require('clock_angle')

describe('Float#hours_to_mins') do
  it("substart 12 hours if hours arguments is greater than 11") do
    expect(0.00.hours_to_mins(12,41)).to(eq(41))
  end
  it("converts hours to mins format") do
    expect(0.00.hours_to_mins(14,0)).to(eq(120))
  end
  it("add minutes to the hours minutes format") do
    expect(0.00.hours_to_mins(15,36)).to(eq(216))
  end
end


describe('Float#mins_to_distance') do
  it("converts minutes to distances") do
    expect(216.00.mins_to_distance()).to(eq(108.00))
  end
end

describe('String#converts_time_to_float') do
  it("converts time to float") do
    expect("13:46".converts_time_to_float()).to(eq([13.00,46.00]))
  end
end

describe('String#time_string_to_distance') do 
  it("convers a time string to a distance in analog clock") do
    expect("13:46".time_string_to_distance()).to(eq(53)) 
  end
end

