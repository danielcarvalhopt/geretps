require 'nokogiri'

module OaiPmh
  class GetRecord
    def initialize(options)
      @xmlns = "http://www.openarchives.org/OAI/2.0/"
      @xmlns_xsi="http://www.w3.org/2001/XMLSchema-instance"
      @xsi_schemaLocation="http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd"
      @request=options[:request]
      @response=Time.now.utc.iso8601
      @identifier = options[:identifier]
      @metadataPrefix = options[:metadataPrefix]
      @valid = validaIdentifier
    end

    def xml
      unless @valid
        exception = OaiPmh::Exception.new(identifier: @identifier,
                                          request: @request,
                                          verb: "GetRecord",
                                          metadataPrefix: @metadataPrefix,
                                          code: "idDoesNotExist",
                                          message: "The value of identifier (#{@identifier}) is unknown or illegal in this repository"
                                          )
        return exception.xml
      end

      unless @metadataPrefix
        exception = OaiPmh::Exception.new(identifier: @identifier,
                                          request: @request,
                                          verb: "GetRecord",
                                          metadataPrefix: @metadataPrefix,
                                          code: "badArgument",
                                          message: "Missing required argument - metadataPrefix"
                                          )
       return exception.xml
      end

      if @metadataPrefix != "oai_dc"
        exception = OaiPmh::Exception.new(identifier: @identifier,
                                          request: @request,
                                          verb: "GetRecord",
                                          metadataPrefix: @metadataPrefix,
                                          code: "cannotDisseminateFormat",
                                          message: "The value of metadataPrefix (#{@metadataPrefix}) is not supported by this item"
                                          )
        return exception.xml
      end

      build = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        xml.send(:"OAI-PMH",'xmlns'=> @xmlns,'xmlns:xsi'=>@xmlns_xsi,'xsi:schemaLocation'=>@xsi_schemaLocation){
          addResponseDate(xml)
          addRequest(xml)
          addGetRecord(xml)
        }
      end
      build.to_xml
    end

    private
    def validaIdentifier

      regex = /\A(oai):(?<REQUEST>#{URI.regexp}):(?<ID>\d+)\z/
      return false unless regex.match(@identifier) || @identifier

      url_default = URI.split(@request)[2]
      url_default+=":"+ URI.split(@request)[3] if URI.split(@request)[3]

      request_url = regex.match(@identifier)["REQUEST"]

      if(request_url == url_default)
        @delivery = Delivery.where(id: regex.match(@identifier)["ID"]).first
        return true if @delivery
      end
      false
    end
    def addResponseDate(xml)
      xml.responseDate @response
    end

    def addRequest(xml)
      xml.request(value: "GetRecord", metadataPrefix: @metadataPrefix, identifier: @identifier){xml.text "#{@request}/oai"}
    end
    def addGetRecord(xml)
      xml.GetRecord{
        addRecord(xml)
      }
    end
    def addRecord(xml)
      xml.record{
        addHeader(xml)
        addMetaData(xml)
      }
    end
    def addHeader(xml)
      sub = @delivery.group.project.subject
      spec = "#{sub.course.institution.name}:#{sub.course.name}:#{sub.name}"

      xml.header{
        xml.identifier @identifier
        xml.datestamp @delivery.created_at.strftime("%Y/%m/%d")
        xml.setSpec "#{URI::encode(spec)}"
      }
    end
    def addMetaData(xml)
      xml.metadata{
        xml.send(:"oai_dc:dc",
                  "xmlns:oai_dc"=>"http://www.openarchives.org/OAI/2.0/oai_dc/",
                  "xmlns:dc"=>"http://purl.org/dc/elements/1.1/",
                  "xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance",
                  "xsi:schemaLocation"=>"http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd"
                ){
          addDeliveryInfo(xml)
        }
      }
    end

    def addDeliveryInfo(xml)
      xml.send(:"dc:title"){xml.text @delivery.group.project.name}
      xml.send(:"dc:creator"){xml.text @delivery.group.members.map{|m|m.student.name}.join(",")}
      xml.send(:"dc:subject"){xml.text @delivery.group.project.subject.name}
      #xml.send(:"dc:identifier"){xml.text @delivery.uri} if @delivery.uri
      xml.send(:"dc:description"){xml.text @delivery.description}
    end
  end
end
