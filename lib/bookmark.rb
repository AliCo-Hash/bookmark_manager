require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    # @bookmarks = []
    if ENV['BOOKMARK'] == 'test'
      conn = PG.connect( dbname: "bookmark_manager_test")
    elsif
      conn = PG.connect( dbname: "bookmark_manager")
    end
    
    result = conn.exec( "SELECT * FROM bookmarks" ) 
    result.map do |bookmark| 
        Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
      end
    end
    # @bookmarks

  def self.create(url:, title:)
    if ENV['BOOKMARK'] == 'test'
      conn = PG.connect( dbname: "bookmark_manager_test")
    elsif
      conn = PG.connect( dbname: "bookmark_manager")
    end
    result = conn.exec_params("INSERT INTO bookmarks (title, url) VALUES ($1, $2) RETURNING id, url, title", [title, url] 
    )
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
    #id = result.first['id']
  end

end