require 'nokogiri'

module OaiPmh
	class Identify
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
          addIdentify(xml)
        }
      end
      build.to_xml
    end

    private
    def addResponseDate(xml)
      xml.responseDate @response
    end

    def addRequest(xml)
      xml.request(value: "Indentify"){xml.text @request}
    end

    def addIdentify(xml)
      xml.Indentify{
        addRepositoryName(xml)
        addBaseUrl(xml)
        addProtocolVersion(xml)
        addEarliestDatestamp(xml)
        addDeleteRecords(xml)
        addAdminEmail(xml)
      }
    end

    def addRepositoryName(xml)
      xml.repositoryName "MyAcademy"
    end

    def addBaseUrl(xml)
      xml.baseURL @request
    end

    def addProtocolVersion(xml)
      xml.protocolVersion "2.0"
    end

    def addAdminEmail(xml)
      xml.adminEmail "localhost@localhost"
    end

    def addEarliestDatestamp(xml)
      xml.earliestDatestamp Publication.all.sort_by{|p|p.date}.first.date.utc.iso8601
    end

    def addDeleteRecords(xml)
      xml.deleteRecords "no"
    end
	end
end
