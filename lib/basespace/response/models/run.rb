module BaseSpace

	class Run < Model
		attribute :date_created, DateTime
		attribute :date_upload_completed, DateTime
		attribute :date_upload_started, DateTime
		attribute :experiment_name, String
		attribute :href, String
		attribute :href_basespace_ui, String
		attribute :href_files, String
		attribute :href_samples, String
		attribute :id, Integer
		attribute :name, String
		attribute :number, Integer
		attribute :status, String
		attribute :user_owned_by, User
		attribute :user_uploaded_by, User
	end
end