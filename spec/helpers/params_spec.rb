require "spec_helper"

describe Pliny::Helpers::Params do

  def app
    Sinatra.new do
      helpers Pliny::Helpers::Params
      post "/" do
        body_params.to_json
      end
    end
  end

  it "loads json params" do
    post "/", {hello: "world"}.to_json, {'CONTENT_TYPE' => 'application/json'}
    assert_equal "{\"hello\":\"world\"}", last_response.body
  end

  it "loads form data params" do
    post "/", {hello: "world"}
    assert_equal "{\"hello\":\"world\"}", last_response.body
  end

  it "loads from an unknown content type" do
    post "/", "<hello>world</hello>", {'CONTENT_TYPE' => 'application/xml'}
    assert_equal "{}", last_response.body
  end
end
