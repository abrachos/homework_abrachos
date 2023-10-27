require 'active_record'

APP_ENV="development"
DB_HOST='localhost'
DB_NAME='prueba'
DB_USER='bracho'
DB_PASS='admin'





DB = ActiveRecord::Base.establish_connection(  
  :adapter => 'postgresql',
  :database => DB_NAME,
  :host =>     DB_HOST,
  :username => DB_USER,
  :password => DB_PASS,
)

ActiveRecord::Base.connection.create_table(:articles, primary_key: 'id', force: true) do |t|
    t.string  :title
    t.string  :content
    t.string  :created_at
end

require_relative 'article'

Article.create(:title => 'Title ABC', :content => 'Lorem Ipsum', :created_at => Time.now)
Article.create(:title => 'Title ZFX', :content => 'Some Blog Post', :created_at => Time.now)
Article.create(:title => 'Title YNN', :content => 'O_O_Y_O_O', :created_at => Time.now)

puts "Article count in DB: #{Article.count}"

