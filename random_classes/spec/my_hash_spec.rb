require('rspec')
require('my_hash')
describe(MyHash) do
  describe("#fetch") do
    it("retrieves a stored value by its key") do
      test_hash = MyHash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.fetch("kitten")).to(eq("cute"))
    end
    
    it("returns 'no existing value matching the key ' + key if no match") do
      test_hash = MyHash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.fetch("kit")).to(eq("no existing value matching the key kit"))
    end
    
  end
  
  describe("#has_value") do
    it("returns true if a value is in a hash") do
      test_hash = MyHash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.has_value("cute")).to(eq(true))
    end
    
    it("returns false if a value is not in a hash") do
      test_hash = MyHash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.has_value("horrible")).to(eq(false))
    end
    
  end
  
  describe('#length') do
    it("returns the hash length") do
      test_hash = MyHash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.length()).to(eq(1))
    end
  end
end