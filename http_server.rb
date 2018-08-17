# http_server.rb
require 'socket'
server = TCPServer.new 5678

while session = server.accept
  request = session.gets
  puts request

  session.print "HTTP/1.1 200\r\n" # 1
  session.print "Content-Type: text/html\r\n" # 2
  session.print "\r\n" # 3
  session.print "
  <!DOCTYPE html>
  <html lang='en'>
  <head>
      <meta charset='UTF-8'>
      <meta name='viewport' content='width=device-width, initial-scale=1.0'>
      <meta http-equiv='X-UA-Compatible' content='ie=edge'>
      <title>Document</title>
  </head>
  <body>
  <form action='' method='post' >
  <input type='text' name='username'>
  <input type='text' name='email'>
  <button type='submit'></button>
</form>
  </body>
  </html> #{Time.now}" #4

  session.close
end