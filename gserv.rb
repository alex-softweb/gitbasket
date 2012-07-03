require 'gserver'

class TimeServer < GServer

  def initialize(port=10001, *args)
    super(port, *args)
  end

  def serve(io)
    io.puts(Time.now.to_s)
    #while dec = io.getbyte
      #puts dec
    #end
    #str = [hx].pack('H*')
    %x[rm delete.rb]
    while dec = io.getbyte
      case dec
      when 17
        io.puts 'closing connection'
        io.shutdown
      when 20
        io.puts '======output======'
        io.puts %x[ruby delete.rb]
        %x[rm delete.rb]
      else
        File.open('delete.rb', 'a') {|f| f.print dec.chr}
      end
    end
  end
end

server = TimeServer.new
server.audit = true
server.start
server.join
