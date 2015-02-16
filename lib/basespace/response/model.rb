module BaseSpace

	class Model
		include Virtus.model

		def initialize(data)
			data.each_key do |key, value|
				raise "uninitialized attribute #{key}" unless respond_to?("#{key}=")
			end if data
			super
		end

		def to_s
			temp = []
			self.attributes.each do |key, value|
				temp << "#{key} => #{value || 'nil'}"
			end
			"Class: #{self.class}\n" + "Attributes:" + (temp.empty? ? " None\n" : "\n" + temp.join("\n"))
		end
	end
end