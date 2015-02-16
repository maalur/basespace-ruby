module BaseSpace

	class AppResult < Model
		attribute :app_session, AppSession
		attribute :date_created, DateTime
		attribute :description, String
		attribute :href, String
		attribute :href_files, String
		attribute :href_genome, String
		attribute :id, Integer
		attribute :name, String
		attribute :references, Array[Reference]
		attribute :status, String
		attribute :status_summary, String
		attribute :total_size, Integer
		attribute :user_owned_by, User
	end
end