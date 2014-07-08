require 'nokogiri'

module OaiPmh
  class Exception
    def initialize(options)
      @xmlns = "http://www.openarchives.org/OAI/2.0/"
      @xmlns_xsi="http://www.w3.org/2001/XMLSchema-instance"
      @xsi_schemaLocation="http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd"
      @request=options[:request]
      @response=Time.now.utc.iso8601
      @code= options[:code]
      @verb = options[:verb]
      @metadataPrefix = options[:metadataPrefix]
      @identifier = options[:identifier]
      @message = options[:message]
    end

    def xml
      build = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        xml.send(:"OAI-PMH",'xmlns'=> @xmlns,'xmlns:xsi'=>@xmlns_xsi,'xsi:schemaLocation'=>@xsi_schemaLocation){
          addResponseDate(xml)
          addRequest(xml)
          addError(xml)
        }
      end
      build.to_xml
    end

    private
    def addResponseDate(xml)
      xml.responseDate @response
    end

    def addRequest(xml)
      args = {}
      args["verb"] = @verb if @verb
      args["resumptionToken"] = @resumptionToken if @resumptionToken
      args["identifier"] = @identifier if @identifier
      args["metadataPrefix"] = @metadataPrefix if @metadataPrefix

      xml.request(args){xml.text "#{@request}/oai"}
    end

    def addError(xml)
      xml.error(code: @code){
        xml.text @message
      }
    end
  end
end
