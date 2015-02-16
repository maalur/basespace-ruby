module BaseSpace

	class User < Model
		attribute :date_created, DateTime
		attribute :date_last_active, DateTime
		attribute :email,	String
		attribute :gravatar_url, String
		attribute :href, String
		attribute :href_projects, String
		attribute :href_runs, String
		attribute :id, Integer
		attribute :name, String
	end
end

