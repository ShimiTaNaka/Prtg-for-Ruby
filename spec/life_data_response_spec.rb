require "prtg/client"
require "prtg/query"
require "prtg/sensor"
require "prtg/device"
require "prtg/value"
require "prtg/live_data_response"
require "mocha"
require  File.dirname(__FILE__) + "/helpers/client_helper_methods.rb"

describe Prtg::LiveDataResponse::Sensors, "parse" do

  include ClientHelperMethods

  it "provide Prtg::Sensor for xml_sensor_set" do
    result = Prtg::LiveDataResponse::Sensors.parse(xml_sensor_set)
    result.sensors.first.should be_a_instance_of(Prtg::Sensor)
  end
end

describe Prtg::LiveDataResponse::Devices, "parse" do

  include ClientHelperMethods

  it "provide Prtg::Device for xml_device_set" do
    result = Prtg::LiveDataResponse::Devices.parse(xml_device_set)
    result.devices.first.should be_a_instance_of(Prtg::Device)
  end
end

describe Prtg::LiveDataResponse::Values, "parse" do

  include ClientHelperMethods

  it "provide Prtg::Value for xml_value_set" do
    result = Prtg::LiveDataResponse::Values.parse(xml_value_set)
    result.values.first.should be_a_instance_of(Prtg::Value)
  end
end