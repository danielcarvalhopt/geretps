require "oai-pmh/list_set.rb"
require "oai-pmh/identify.rb"
require "oai-pmh/list_metadata_formats.rb"
require "oai-pmh/get_record.rb"
require "oai-pmh/list_identifiers.rb"
require "oai-pmh/list_records.rb"
require "oai-pmh/exception.rb"

class OaiController < ApplicationController
  def index
    options = params.delete_if { |k,v| %w{controller action}.include?(k) }


    case options["verb"]
    when "ListSets"
      response = OaiPmh::ListSet.new(request: request.base_url, resumptionToken: options["resumptionToken"])
    when "Indentify"
      response = OaiPmh::Identify.new(request.base_url)
    when "ListMetadataFormats"
      response = OaiPmh::ListMetadataFormats.new("#{request.base_url}/oai")
    when "GetRecord"
      response = OaiPmh::GetRecord.new(request: request.base_url, identifier: options["identifier"], metadataPrefix: options["metadataPrefix"])
    when "ListIdentifiers"
      response = OaiPmh::ListIdentifiers.new(request: request.base_url, resumptionToken: options["resumptionToken"], metadataPrefix: options["metadataPrefix"])
    when "ListRecords"
      response = OaiPmh::ListRecords.new(request: request.base_url)
    else
      response = OaiPmh::Exception.new(request: request.base_url, code: "badVerb", message: "Illegal OAI verb")
    end
    render :text => response.xml, :content_type => 'text/xml'
  end
end
