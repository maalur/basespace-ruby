module BaseSpace
	def self.parse_json(json_string)
		data = JSON.parse(json_string)
		convert_keys(data)
	end

	def self.convert_keys(data)
		Hash[data.map do |k, v|
			val = if v.is_a?(Hash)
				convert_keys(v)
			elsif v.is_a?(Array)
				v.map { |hash| convert_keys(hash) }
			else
				v
			end
			[KEYS[k] || k, val]
		end]
	end
end