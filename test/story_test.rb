require 'minitest/autorun'
require 'minitest/pride'
require './lib/story'

class StoryTest < Minitest::Test

  def test_stories_loads
    story = Story.new(0, "./data/nytimes.json" )

    assert_instance_of Story, story
  end

  def test_story_loads
    story = Story.new(0, "./data/nytimes.json")

    assert_equal "U.S.", story.section
    assert_equal "Politics", story.subsection
    assert_equal "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal", story.title
    assert_equal "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.", story.abstract
    assert_equal "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html", story.link
    assert_equal "November 29, 2018", story.published
    assert_equal "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-thumbStandard.jpg", story.photo
  end

  def test_array_of_stories
    stories = Story.get_stories

    assert_equal 43, stories.count
  end
end
