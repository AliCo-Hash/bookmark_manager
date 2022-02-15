require 'pg'

def set_up_table
    conn = PG.connect( dbname: "bookmark_manager_test")
    conn.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));")
end

def drop_table
    conn = PG.connect( dbname: "bookmark_manager_test")
    conn.exec("DROP TABLE bookmarks")
end