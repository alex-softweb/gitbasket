require 'gserver'

class TimeServer < GServer

  def initialize(port=10001, *args)
    super(port, *args)
  end

  def serve(io)
    begin
      io.puts(Time.now.to_s)
      #io.print "\xff\xfb\x01"
      io.print "\377\373\3" # send IAC WILL SUPPRESS-GOAHEAD
      while dec = io.getbyte
       case dec
       #when 127
         #io.print "\x8"
       when 127
         io.print "\b"
         io.print "\b"
       else
         print dec.chr
       end
      end
      #%x[rm delete.rb]
      #while dec = io.getbyte
        #case dec
        #when 17
          #io.puts 'closing connection'
          #io.shutdown
        #when 20
          #io.puts '======output======'
          #io.puts %x[ruby delete.rb]
          #io.puts '=================='
          #%x[rm delete.rb]
        #else
          #File.open('delete.rb', 'a') {|f| f.print dec.chr}
        #end
      #end
    rescue => e
      print e
    end
  end
end

server = TimeServer.new
server.audit = true
server.start
server.join

  #str = [hx].pack('H*')
