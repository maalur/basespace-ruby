module BaseSpace

	class List < Model
		attribute :displayed_count, Integer
		attribute :limit, Integer
		attribute :offset, Integer
		attribute :sort_by, String
		attribute :sort_dir, String
		attribute :total_count, Integer
	end
end