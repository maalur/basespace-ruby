module BaseSpace

	class OAuth < Model
		attribute :access_token, String
		attribute :application, Application
		attribute :date_created, DateTime
		attribute :scopes, Array[String]
		attribute :status, String
		attribute :user_resource_owner, User
	end
end