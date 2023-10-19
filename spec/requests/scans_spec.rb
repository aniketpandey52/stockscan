require 'rails_helper'

RSpec.describe ScansController, type: :controller do
  describe "GET #index" do
    it "returns a list of scans as JSON" do
      # Create sample scans
      scan1 = Scan.create(name: "Scan 1", tag: "Tag 1", color: "Red", url: "scan-1")
      scan2 = Scan.create(name: "Scan 2", tag: "Tag 2", color: "Blue", url: "scan-2")

      get :index

      expect(response).to be_successful
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(2)
      expect(parsed_response[0]["name"]).to eq("Scan 1")
      expect(parsed_response[1]["name"]).to eq("Scan 2")
    end
  end

  describe "GET #show" do
    it "returns a scan with associated criteria and variables as JSON" do
      # Create a sample scan with associated criteria and variables
      scan = Scan.create(name: "Sample Scan", tag: "Sample Tag", color: "Green", url: "sample-scan")
      criterion = scan.criteria.create(category: "Sample Category", text: "Sample Text", url: "sample-criteria")
      variable = criterion.variables.create(category: "Sample Variable", properties: { key: "value" }.to_json, url: "sample-variable", identifier: "sample-identifier")

      get :show, params: { id: scan.url }

      expect(response).to be_successful
      parsed_response = JSON.parse(response.body)

      # Validate scan attributes
      expect(parsed_response["name"]).to eq("Sample Scan")
      expect(parsed_response["tag"]).to eq("Sample Tag")
      expect(parsed_response["color"]).to eq("Green")

      # Validate criteria and variables
      expect(parsed_response["criteria"].length).to eq(1)
      criteria = parsed_response["criteria"][0]
      expect(criteria["type"]).to eq("Sample Category")
      expect(criteria["text"]).to eq("Sample Text")
      expect(criteria["variable"].length).to eq(1)
      variable = criteria["variable"]["sample-identifier"]
      expect(variable["type"]).to eq("Sample Variable")
      expect(variable["key"]).to eq("value")
      expect(variable["url"]).to eq("sample-variable")
    end
  end
end
