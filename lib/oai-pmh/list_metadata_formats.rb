require 'nokogiri'

module OaiPmh
  class ListMetadataFormats
    def initialize(request)
      @xmlns = "http://www.openarchives.org/OAI/2.0/"
      @xmlns_xsi="http://www.w3.org/2001/XMLSchema-instance"
      @xsi_schemaLocation="http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd"
      @request=request
      @response=Time.now.utc.iso8601
    end

    def xml
      build = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        xml.send(:"OAI-PMH",'xmlns'=> @xmlns,'xmlns:xsi'=>@xmlns_xsi,'xsi:schemaLocation'=>@xsi_schemaLocation){
          addResponseDate(xml)
          addRequest(xml)
          addListMetadataFormats(xml)
        }
      end
      build.to_xml
    end

    private
    def addResponseDate(xml)
      xml.responseDate @response
    end

    def addRequest(xml)
      xml.request(value: "ListMetadataFormats"){xml.text @request}
    end

    def addListMetadataFormats(xml)
      xml.ListMetadataFormats{
        addMetadataFormat(xml)
      }
    end

    def addMetadataFormat(xml)
      xml.metadataFormat{
        xml.metadataPrefix "oai_dc"
        xml.schema "http://www.openarchives.org/OAI/2.0/oai_dc.xsd"
        xml.metadataNamespace "http://www.openarchives.org/OAI/2.0/oai_dc"
      }
    end
  end
end
