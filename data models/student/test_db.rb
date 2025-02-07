require 'dotenv/load'
require 'pg'
host = ENV['DB_HOST']
port = ENV['DB_PORT']
dbname = ENV['DB_NAME']
user = ENV['DB_USER']
password = ENV['DB_PASSWORD']

begin
    connection = PG.connect(
        host: host,
        port: port,
        dbname: dbname,
        user: user,
        password: password
    )

    result = connection.exec("SELECT * FROM student;") 

    result.each do |row|
        puts row
    end
ensure

    connection.close if connection
end