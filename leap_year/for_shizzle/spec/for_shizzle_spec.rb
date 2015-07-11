require('rspec')
require('for_shizzle')

describe('String#foshizzle') do
  it('replaces every "s" in a string with a "z"') do
    expect("roses".foshizzle).to(eq("rozez"))
  end

  it('does NOT replace the first letter when it is an s') do
    expect("sunshine".foshizzle).to(eq("sunzhine"))
  end

  it('replaces letters correctly in a string of words') do
    expect("moses supposes his toeses are roses".foshizzle).to(eq("mozez suppozez hiz toezez are rozez"))
  end

  it('makes correct replacements regardless of case') do
    expect("Mrs. McSweet's street is Astoria Street!".foshizzle).to(eq("Mrz. McSweet'z street iz Aztoria Street!"))
  end
end