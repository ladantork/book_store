require_relative 'book'
class BookRepository

    # Selecting all records
    # No arguments
    def all
      # Executes the SQL query:
      sql = 'SELECT * FROM books;'
      result = DatabaseConnection.exec_params(sql, [])

      
      result.map {|record| 
        book = Book.new
        book.id = record['id']
        book.title = record['title']
        book.author_name = record['author_name']
        book
      }
  
      # Returns an array of Book objects
    end
  end