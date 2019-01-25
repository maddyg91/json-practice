require 'pry'
require 'date'
class Story
 attr_reader :section, :subsection, :title, :abstract, :link, :published, :photo

 def initialize(index, data_path)
   json = JSON.load(File.read("./data/nytimes.json"))
   story = json["results"]

   @section = story[index]["section"]
   @subsection = story[index]["subsection"]
   @title = story[index]["title"]
   @abstract = story[index]["abstract"]
   @link = story[index]["url"]
   @published = Date.parse(story[index]["published_date"]).strftime("%B %d, %Y")
   @photo = story[index]["multimedia"][0]["url"] || "No Photo Available"
 end

 def self.get_stories
   json = JSON.load(File.new("./data/nytimes.json"))
   data_path = "./data/nytimes.json"
   stories = json["results"].map.with_index do |story, index|
     Story.new(index, data_path)
   end
 end

end
