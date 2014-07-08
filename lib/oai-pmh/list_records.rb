require 'nokogiri'

module OaiPmh
  class ListRecords
    def initialize(options)
      @xmlns = "http://www.openarchives.org/OAI/2.0/"
      @xmlns_xsi="http://www.w3.org/2001/XMLSchema-instance"
      @xsi_schemaLocation="http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd"
      @request=options[:request]
      @response=Time.now.utc.iso8601
      @from = options[:from]
      @until = options[:until]
      @set = options[:set]
      @resumptionToken = options[:resumptionToken]
      @metadataPrefix = options[:metadataPrefix]
    end

    def xml
      build = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        xml.send(:"OAI-PMH",'xmlns'=> @xmlns,'xmlns:xsi'=>@xmlns_xsi,'xsi:schemaLocation'=>@xsi_schemaLocation){
          addResponseDate(xml)
          addRequest(xml)
          addListRecords(xml)
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
      args["value"] = "ListRecords"
      args["metadataPrefix"] = @metadataPrefix
      args["resumptionToken"] = @resumptionToken if @resumptionToken
      args["set"] = @set if @set
      args["from"] = @from if @from
      args["until"] = @until if @until
      xml.request(args){xml.text @request}
    end

    def addListRecords(xml)
      xml.ListRecords{
        Delivery.all.each do |d|
          addRecord(xml,d)
        end
      }
    end

    def addRecord(xml,delivery)
      url = URI.split(@request)[2]
      url+=":"+ URI.split(@request)[3] if URI.split(@request)[3]
      xml.record{
        addHeader(xml,delivery,url)
        addMetaData(xml,delivery)
      }
    end

    def addHeader(xml,delivery,url)
      sub = delivery.group.project.subject
      spec = "#{sub.course.institution.name}:#{sub.course.name}:#{sub.name}"

      xml.header{
        xml.identifier "oai:#{url}:#{delivery.id}"
        xml.datestamp delivery.created_at.strftime("%Y/%m/%d")
        xml.setSpec "#{URI::encode(spec)}"
      }
    end

    def addMetaData(xml,delivery)
      xml.metadata{
        xml.send(:"oai_dc:dc",
                 "xmlns:oai_dc"=>"http://www.openarchives.org/OAI/2.0/oai_dc/",
                 "xmlns:dc"=>"http://purl.org/dc/elements/1.1/",
                 "xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance",
                 "xsi:schemaLocation"=>"http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd"
        ){
          addDeliveryInfo(xml,delivery)
        }
      }
    end

    def addDeliveryInfo(xml,delivery)
      xml.send(:"dc:title"){xml.text delivery.group.project.name}
      xml.send(:"dc:creator"){xml.text delivery.group.members.map{|m|m.student.name}.join(",")}
      xml.send(:"dc:subject"){xml.text delivery.group.project.subject.name}
      #xml.send(:"dc:identifier"){xml.text delivery.uri} if delivery.uri
      xml.send(:"dc:description"){xml.text delivery.description}
    end
  end
end
