module BaseSpace

	class Application < Model
		attribute :date_created, DateTime
		attribute :homepage_uri, String
		attribute :href, String
		attribute :id, Integer
		attribute :is_billing_activated, Boolean
		attribute :name, String
		attribute :short_description, String
	end
end