require 'book_repository'
# file: spec/book_repository_spec.rb

def reset_books_table
    seed_sql = File.read('spec/book_store.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end
  
  describe BookRepository do
    before(:each) do 
      reset_books_table
    end
  
    # (your tests will go here).
    

    it 'gets all the books' do
      repo =BookRepository.new
      books = repo.all

      expect(books.length).to eq 5 # =>  5

      expect(books[0].id).to eq '1' # =>  1
      expect(books[0].title).to eq  'Nineteen Eighty-Four' # =>  'Nineteen Eighty-Four'
      expect(books[0].author_name).to eq  'George Orwell'# =>  'George Orwell'
    end 
  end
  
    