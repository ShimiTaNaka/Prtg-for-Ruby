require "prtg/client"
require "prtg/query"
require "prtg/sensor"
require "prtg/live_data_response"
require "mocha"
require  File.dirname(__FILE__) + "/helpers/client_helper_methods.rb"

describe Prtg::LiveDataResponse, "parse" do

  include ClientHelperMethods

  it "provide Prtg::Sensor for xml_sensor_set" do
    result = Prtg::LiveDataResponse.parse(xml_sensor_set)
    result.sensors.first.should be_a_instance_of(Prtg::Sensor)
  end
end

