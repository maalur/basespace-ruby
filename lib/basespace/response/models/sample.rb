module BaseSpace

	class Sample < Model
		attribute :app_session, AppSession
		attribute :date_created, DateTime
		attribute :experiment_name, String
		attribute :href, String
		attribute :href_files, String
		attribute :href_genome, String
		attribute :id, Integer
		attribute :is_paired_end, Boolean
		attribute :name, String
		attribute :num_reads_pf, Integer
		attribute :num_reads_raw, Integer
		attribute :read1, Integer
		attribute :read2, Integer
		attribute :references, Array[Reference]
		attribute :sample_id, Integer
		attribute :sample_number, Integer
		attribute :status, String
		attribute :status_summary, String
		attribute :user_owned_by, User
	end
end