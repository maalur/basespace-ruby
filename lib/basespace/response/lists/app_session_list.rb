module BaseSpace

	class AppSessionList < List
		attribute :items, Array[AppSession]
	end
end