
require 'net/http'
require 'json'

url = URI.parse('http://api.geonames.org/childrenJSON?&geonameId=3337388&username=alexravs')
req = Net::HTTP::Get.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
#puts res.body

puts "LOL"
count = 0

value = res.body
#puts JSON.parse(value) # => {"val"=>"test","val1"=>"test1","val2"=>"test2"}
provinces = JSON.parse(value)
#puts provinces
provinces["geonames"].each do |province|
  prov = province["name"]
  puts province
  puts "hello " + province["geonameId"].to_s
 
  puts count
  url = URI.parse('http://api.geonames.org/childrenJSON?geonameId='+province["geonameId"].to_s+'&username=alexravs')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  value = res.body
  arrondissements = JSON.parse(value)
  arrondissements["geonames"].each do |arrondissement|
    url = URI.parse('http://api.geonames.org/childrenJSON?geonameId='+arrondissement["geonameId"].to_s+'&username=alexravs')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    value = res.body
    villes = JSON.parse(value)   
    villes["geonames"].each do |ville|
      url = URI.parse('http://api.geonames.org/childrenJSON?geonameId='+ville["geonameId"].to_s+'&username=alexravs')
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      value = res.body
      communes = JSON.parse(value)    
      communes["geonames"].each do |commune|
        
        puts commune
        puts commune.fetch("toponymName") 
        City.create({name: commune.fetch("toponymName"), region: commune.fetch("adminName1"), lng: commune.fetch("lng").to_f, lat: commune.fetch("lat").to_f, country: commune.fetch("countryName"), countr_code: commune.fetch("countryCode"), province: prov })
        puts count
        count = count + 1
      end
      
      #sleep(5)
    end
  end
end