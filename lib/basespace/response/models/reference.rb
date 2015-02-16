module BaseSpace

	class Reference < Model
		attribute :href, String
		attribute :href_content, String
		attribute :rel, String
		attribute :type, String

		def initialize(data)
			self.class.class_eval do
		  	attribute :content, BaseSpace.const_get(data[:type])
		  end
			super
		end
	end
end