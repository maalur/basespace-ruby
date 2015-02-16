module BaseSpace

	class AppSession < Model
		attribute :application, Application
		attribute :date_created, DateTime
		attribute :href, String
		attribute :id, Integer
		attribute :references, Array[Reference]
		attribute :status, String
		attribute :status_summary, String
		attribute :user_created_by, User
	end
end