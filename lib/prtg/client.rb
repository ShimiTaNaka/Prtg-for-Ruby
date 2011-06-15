require "net/https"
require "uri"
require "cgi"
require "prtg/utils"

module Prtg # :nodoc:
  class Client

    # The host is a Net:Http(s) instance
    attr_accessor :host

    # Username of the prtg user
    attr_accessor :username

    # Password for prtg user
    #
    # The password is just temporary because of the intension to
    # use +passhash+ as auth method.
    attr_writer :password

    attr_accessor :passhash

    def initialize(args)
      args.each do |k,v|
        send("#{k}=", v)
      end

      @host or raise ArgumentError.new("Need host")
    end

    # The +passhash+ in comibnation with the +username+ is used for
    # authentication. The passhash gets generated by the prtg instance.
    #
    # If no passhash is set he gets lazy converted using +password+
    def passhash
      @passhash ||= getpasshash
    end

    def getpasshash
      url = "/api/getpasshash.htm?"+ Utils.url_params(:username => @username, :password => @password)
      host.get(url).body
    end

    def method_missing(*args)
      super(*args)
    end
  end
end