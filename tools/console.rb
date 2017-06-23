require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

sarah = Viewer.new("sarah", "evans")
wes = Viewer.new("wes", "jansen")
devin = Viewer.new("devin", "renton")
ellis = Viewer.new("aidan", "ellis")

nebulaquest = Movie.new("nebulaquest")
major_league = Movie.new("major league")

rating1 = Rating.new(10, wes, nebulaquest)
rating2 = Rating.new(7, devin, nebulaquest)
rating3 = Rating.new(5, ellis, nebulaquest)
rating4 = Rating.new(8, ellis, major_league)
rating5 = Rating.new(10, sarah, major_league)
rating6 = Rating.new(3, devin, major_league)

devin.create_rating(10, "flatliners")
inception = Movie.new("inception")
devin.create_rating(10, inception)

Viewer.all
Pry.start
