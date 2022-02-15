require 'pg'

class Bookmark

  def self.all
    @bookmarks = []
    if ENV['BOOKMARK'] == 'test'
      conn = PG.connect( dbname: "bookmark_manager_test")
    elsif
      conn = PG.connect( dbname: "bookmark_manager")
    end
    
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      result.each do |row| 
        @bookmarks << row['url']
      end
    end
    @bookmarks
  end

  def create(url)
    if ENV['BOOKMARK'] == 'test'
      conn = PG.connect( dbname: "bookmark_manager_test")
    elsif
      conn = PG.connect( dbname: "bookmark_manager")
    end

    conn.exec("INSERT INTO bookmarks (url) VALUES (#{url})") 
  end

end