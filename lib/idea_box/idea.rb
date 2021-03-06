class Idea
  include Comparable
  attr_reader :title, :description, :rank, :id, :tags, :general

  def initialize(attributes = {})
    @title = attributes["title"]
    @description = attributes["description"]
    @rank = attributes["rank"] || 0
    @id = attributes["id"]
    @tags = [attributes["general_tag"], attributes["career_tag"], attributes["health_tag"], attributes["social_tag"]]
  end

  def save
    IdeaStore.create(to_h)
  end

  def to_h
    {
      "title" => title,
      "description" => description,
      "rank" => rank,
      "tags" => tags
    }
  end

  def database
    Idea.database
  end

  def like!
    @rank += 1
  end

  def <=>(other)
    other.rank <=> rank
  end
end
