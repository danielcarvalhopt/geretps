require 'nokogiri'
require 'oai-pmh/exception.rb'
require 'securerandom'
require 'will_paginate/array'

module OaiPmh
  class ListSet
    def initialize(options)
      @xmlns = "http://www.openarchives.org/OAI/2.0/"
      @xmlns_xsi="http://www.w3.org/2001/XMLSchema-instance"
      @xsi_schemaLocation="http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd"
      @request=options[:request]
      @resumptionToken=options[:resumptionToken]
      @response=Time.now.utc.iso8601
      @pageSize = 100
      @page = 1
      @cursor = 0
    end

    def xml
      @oai_request = OaiPmhRequest.where(resumption_code: @resumptionToken).first if @resumptionToken
      @cursor = @oai_request.cursor+@pageSize if @oai_request

      if(@oai_request || !@resumptionToken)
        if(@oai_request && @oai_request.verb != "ListSets")
          exception = OaiPmh::Exception.new(request: @request, resumptionToken: @resumptionToken, verb: "ListSets", code: "badResumptionToken", message: "This resumptionToken (#{@resumptionToken}) is not valid. Resumption tokens are not issued for ListSets from this repository." )
          return exception.xml
        end
        build = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
          xml.send(:"OAI-PMH",'xmlns'=> @xmlns,'xmlns:xsi'=>@xmlns_xsi,'xsi:schemaLocation'=>@xsi_schemaLocation){
            addResponseDate(xml)
            addRequest(xml)
            addListSets(xml)
          }
        end
        entry = OaiPmhRequest.new(resumption_code: @resumptionToken, verb: "ListSets", cursor: @cursor)
        entry.save if @resumptionToken
        build.to_xml
      else
        exception = OaiPmh::Exception.new(request: @request, verb: "ListSets", resumptionToken: @resumptionToken, code: "badResumptionToken", message: "This resumptionToken (#{@resumptionToken}) is not valid. Resumption tokens are not issued for ListSets from this repository.")
        exception.xml
      end
    end
    private
    def addResponseDate(xml)
      xml.responseDate @response
    end

    def addRequest(xml)
      args = {}
      args["value"] = "ListSets"
      args["resumptionToken"] = @resumptionToken if @resumptionToken
      xml.request(args){xml.text "#{@request}/oai"}
    end


    def addListSets(xml)
      @page = @oai_request.cursor/@pageSize + 2 if @oai_request

      @listSets = []
      Institution.all.each do |i|
        @listSets << {spec: i.name, name: i.name}
        i.courses.each do |c|
          @listSets << {spec: "#{i.name}:#{c.name}", name: "#{c.name} - #{i.name}"}
          c.subjects.each do |s|
            @listSets << {spec: "#{i.name}:#{c.name}:#{s.name}", name: "#{s.name} - #{c.name} - #{i.name}"}
          end
        end
      end

      xml.ListSets{
        @listSets.paginate(page: @page, per_page: @pageSize).each do |set|
          addSet(xml,set)
        end
        addResumptionToken(xml)
      }
    end


    def addSet(xml,set)
      xml.set{
        xml.setSpec URI::encode set[:spec]
        xml.setName set[:name]
      }
    end

    def addResumptionToken(xml)
      resumptionToken = SecureRandom.hex
      if(@listSets.paginate(page: @page+1, per_page: @pageSize).first)
        xml.resumptionToken(completeListSize: @listSets.size, cursor: @cursor){
          xml.text resumptionToken
        }
        @resumptionToken = resumptionToken
      else
        @resumptionToken = nil
      end
    end
  end
end
