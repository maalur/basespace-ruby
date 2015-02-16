module BaseSpace

	class Project < Model
		attribute :date_created, DateTime
		attribute :href, String
		attribute :href_app_results, String
		attribute :href_basespace_ui, String
		attribute :href_samples, String
		attribute :id, Integer
		attribute :name, String
		attribute :transfer_pending, Boolean
		attribute :user_owned_by, User
	end
end