require 'spec_helper'

describe BaseSpace do
	describe BaseSpace, '#convert_keys' do
		it 'converts JSON string keys to symbols' do
			converted = BaseSpace.convert_keys(BaseSpace::KEYS).keys
			expect( converted ).to eq(BaseSpace::KEYS.values)
		end

		it 'converts keys in nested hashes' do
			converted = BaseSpace.convert_keys("convert" => [BaseSpace::KEYS])["convert"][0].keys
			expect( converted ).to eq(BaseSpace::KEYS.values)
		end

		it "only converts keys in the KEYS hash" do
			converted = BaseSpace.convert_keys({ "Something"=>"something"}).keys
			expect( converted ).to eq(["Something"])
		end
	end

	describe BaseSpace, '#parse_json' do
		json = '{
			"Response": {
        "Items" : [
          {
            "Id": "1019",
            "Href": "v1pre3/runs/1019",
            "ExperimentName": "2X151 Rhodobacter Resequencing",
            "Status": "Complete",
            "DateCreated": "2011-11-11T02:56:38.0000000"
          },
          {
            "Id": "1021",
            "Href": "v1pre3/runs/1021",
            "ExperimentName": "2x26 Validation Human 4-Plex",
            "Status": "Complete",
            "DateCreated": "2011-11-11T02:56:48.0000000"
          }
      	],
	      "SortBy":"Id",
	      "DisplayedCount":2,
	      "TotalCount":2,
	      "Offset":0,
	      "Limit":10,
	      "SortDir":"Asc"
    	},
  		"ResponseStatus":{},
  		"Notifications":[]
		}'

		result = {
			response: {
				items: [
					{
						id: "1019",
            href: "v1pre3/runs/1019",
            experiment_name: "2X151 Rhodobacter Resequencing",
            status: "Complete",
            date_created: "2011-11-11T02:56:38.0000000"
					},
					{
						id: "1021",
            href: "v1pre3/runs/1021",
            experiment_name: "2x26 Validation Human 4-Plex",
            status: "Complete",
            date_created: "2011-11-11T02:56:48.0000000"
					}
				],
				sort_by: "Id",
				displayed_count: 2,
				total_count: 2,
				offset: 0,
				limit: 10,
				sort_dir: "Asc"
			},
			response_status: {},
			notifications: []
		}

		it 'converts a JSON response to a Ruby hash' do
			expect( BaseSpace.parse_json(json) ).to eq(result)
		end
	end
end