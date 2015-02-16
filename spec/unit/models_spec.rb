require 'spec_helper'

describe BaseSpace::Model do
  it 'errors if an invalid attribute is passed in' do
    expect { BaseSpace::Model.new(id: 1) }.to raise_error('uninitialized attribute id')
  end

  describe '#to_s' do
    it 'returns a stringified version of the object' do
      expect( BaseSpace::Model.new({}).to_s ).to eq( "Class: BaseSpace::Model\nAttributes: None\n" )
    end
  end
end

describe BaseSpace::List do
  describe '#to_s' do
    it 'returns a stringified version of the object' do
      expected = "Class: BaseSpace::List\nAttributes:\ndisplayed_count => nil\nlimit => nil\noffset => nil\nsort_by => nil\nsort_dir => nil\ntotal_count => nil"
      expect( BaseSpace::List.new({}).to_s ).to eq( expected )
    end
  end
end

describe BaseSpace::User do
	data = {
		date_created: "2011-12-17T00:50:29.0000000",
		date_last_active: "2012-03-20T19:57:56.0000000",
		email: "jdoe@domain.com",
		gravatar_url: "https://secure.gravatar.com/avatar.....",
		href: "v1pre3/users/1001",
		href_projects: "v1pre3/users/1001/projects",
		href_runs: "v1pre3/users/1001/runs",
		id: "1001",
		name: "John Doe"
	}

	it 'creates a BaseSpace::User object from a data hash' do
		user = BaseSpace::User.new(data)
		expect( user.class ).to eq(BaseSpace::User)
	end
end

describe BaseSpace::Run do
	data = {
    name: "110512_COnfig376vm0a_0432_AFCPE151RHO",
    number: 0,
    href_files: "v1pre3/runs/1019/files",
    href_samples: "v1pre3/runs/1019/samples",
    user_uploaded_by: {
        id: "1003",
        href: "v1pre3/users/1003",
        name: "Jane Doe"
    },
    user_owned_by: {
        id: "1003",
        href: "v1pre3/users/1003",
        name: "Jane Doe"
    },
    date_upload_completed: "2011-11-11T03:30:10.0000000",
    date_upload_started: "2011-11-11T03:04:58.0000000",
    href_basespace_ui: "https://basespace.illumina.com/run/1019/2X151 Rhodobacter Resequencing",
    id: "1019",
    href: "v1pre3/runs/1019",
    experiment_name: "2X151 Rhodobacter Resequencing",
    status: "Complete",
    date_created: "2011-11-11T02:56:38.0000000"
	}

	it 'creates a BaseSpace::Run object from a data hash' do
		run = BaseSpace::Run.new(data)
		expect( run.class ).to eq(BaseSpace::Run)
	end

	it 'has two BaseSpace::User attributes' do
		run = BaseSpace::Run.new(data)
		expect( run.user_owned_by.class ).to eq(BaseSpace::User)
		expect( run.user_uploaded_by.class ).to eq(BaseSpace::User)
	end
end

describe BaseSpace::RunList do
	data = {
    items: [
      {
        id: "1019",
        href: "v1pre3/runs/1019",
        experiment_name: "2X151 Rhodobacter Resequencing",
        status: "Complete",
        date_created: "2011-11-11T02:56:38.0000000"
      }
  	],
  	sort_by: "Id",
  	displayed_count: 2,
  	total_count: 2,
  	offset: 0,
  	limit: 10,
  	sort_dir: "Asc"
	}

	it 'creates a BaseSpace::RunList object from a data hash' do
		run_list = BaseSpace::RunList.new(data)
		expect( run_list.class ).to eq(BaseSpace::RunList) 
	end

	it 'has an array of BaseSpace::Run objects' do
		run_list = BaseSpace::RunList.new(data)
		expect( run_list.items.class ).to eq(Array)
		expect( run_list.items.all? { |run| run.class == BaseSpace::Run } ).to eq(true)
	end
end

describe BaseSpace::Project do
	data = {
    href_samples: "v1pre3/projects/1/samples",
    href_app_results: "v1pre3/projects/1/appresults",
    href_basespace_ui: "https://basespace.illumina.com/project/1/HiSeq 2500",
    id: "1",
    user_owned_by: {
      id: "1001",
      href: "v1pre3/users/1001",
      name: "John Doe"
    },
    href: "v1pre3/projects/1",
    name: "HiSeq 2500",
    date_created: "2012-06-01T16:13:06.0000000"
  }
  project = BaseSpace::Project.new(data)

	it 'creates a BaseSpace::Project' do
		expect( project.class ).to eq(BaseSpace::Project)
	end

	it 'has a BaseSpace::User object attribute' do
		expect( project.user_owned_by.class ).to eq(BaseSpace::User)
	end
end

describe BaseSpace::ProjectList do
	data = {
    items: [
      {
        id: "52",
        user_owned_by: {
          id: "74074",
          href: "v1pre3/users/1001",
          name: "John Doe"
        },
        href: "v1pre3/projects/1",
        name: "CurrentWork",
        date_created: "2012-06-01T16:13:06.0000000"
      }
    ],
    displayed_count: 2,
    total_count: 15,
    offset: 0,
    limit: 2,
    sort_dir: "Asc",
    sort_by: "Id"
  }

  project_list = BaseSpace::ProjectList.new(data)

  it 'creates a BaseSpace::ProjectList object' do
  	expect( project_list.class ).to eq(BaseSpace::ProjectList)
  end

  it 'has an array of BaseSpace::Project objects' do
  	expect( project_list.items.class ).to eq(Array)
		expect( project_list.items.all? { |proj| proj.class == BaseSpace::Project } ).to eq(true)
  end
end

describe BaseSpace::Reference do
  data = {
    rel: "Input",
    type: "Project",
    href: "v1pre3/projects/76076",
    href_content: "v1pre3/projects/76076",
    content: {
      id: "76076",
      user_owned_by: {
        id: "74074",
        href: "v1pre3/users/74074",
        name: "BaseSpace Illumina"
      },
      href: "v1pre3/projects/76076",
      name: "Project_BacillusCereus",
      date_created: "2012-08-21T07:31:37.0000000"
    }
  }

  reference = BaseSpace::Reference.new(data)

  it 'creates a BaseSpace::Reference object' do
    expect( reference.class ).to eq(BaseSpace::Reference)
  end

  it 'has a dynamic attribute of type equal to #type' do
    expect( reference.content.class ).to eq(BaseSpace.const_get(data[:type]))
  end
end

describe BaseSpace::Application do
  data = {
    id: "3003",
    href: "v1pre3/applications/3003",
    name: "BaseMaker 5000",
    homepage_uri: "http://www.yourapphomepageuri.com/",
    short_description: "Just an app...",
    date_created: "2012-06-04T20:23:02.0000000"
  }

  application = BaseSpace::Application.new(data)

  it 'creates a BaseSpace::Application object' do
    expect( application.class ).to eq(BaseSpace::Application)
  end
end

describe BaseSpace::AppSession do
  data = {
    references: [
      {
        rel: "Input",
        type: "Project",
        href: "v1pre3/projects/76076",
        href_content: "v1pre3/projects/76076",
        content: {
          id: "76076",
          user_owned_by: {
            id: "74074",
            href: "v1pre3/users/74074",
            name: "BaseSpace Illumina"
          },
          href: "v1pre3/projects/76076",
          name: "Project_BacillusCereus",
          date_created: "2012-08-21T07:31:37.0000000"
        }
      }
    ],
    id: "d840251ab9c441639a9b2f047ded51fd",
    href: "v1pre3/appsessions/d840251ab9c441639a9b2f047ded51fd",
    application: {
        id: "3003",
        href: "v1pre3/applications/3003",
        name: "BaseMaker 5000",
        homepage_uri: "http://www.yourapphomepageuri.com/",
        short_description: "Just an app...",
        date_created: "2012-06-04T20:23:02.0000000"
    },
    user_created_by: {
        id: "37037",
        href: "v1pre3/users/37037",
        name: "John Doe"
    },
    status: "Running",
    status_summary: "",
    date_created: "2012-09-04T08:44:38.0000000"
  }
  app_session = BaseSpace::AppSession.new(data)

  it 'creates a BaseSpace::AppSession' do
    expect( app_session.class ).to eq(BaseSpace::AppSession)
  end

  it 'has a BaseSpace::User object attribute' do
    expect( app_session.user_created_by.class ).to eq(BaseSpace::User)
  end

  it 'has a BaseSpace::Application object attribute' do
    expect( app_session.application.class ).to eq(BaseSpace::Application)
  end

  it 'has an array of BaseSpace::Reference objects' do
    expect( app_session.references.class ).to eq(Array)
    expect( app_session.references.all? { |ref| ref.class == BaseSpace::Reference } ).to eq(true)
  end
end

describe BaseSpace::AppSessionList do
  data = {
    items: [
      {
        id: "f4447f1619b6471cace779cb97fa2c75",
        href: "v1pre3/appsessions/f4447f1619b6471cace779cb97fa2c75",
        application: {
          id: "75075",
          href: "v1pre3/applications/75075",
          name: "hoth test purchase app",
          homepage_uri: "http://google.com",
          short_description: "this is for testing purchases",
          date_created: "2013-04-03T20:50:44.0000000"
        },
        user_created_by: {
          id: "17017",
          href: "v1pre3/users/17017",
          name: "Mayank Tyagi",
          gravatar_url: "https://secure.gravatar.com/avatar/300fb1f0db0919def56fdbe4f1a19525.jpg?s=20&d=https%3a%2f%2fcloud-hoth.illumina.com%2fpublic%2fimages%2fDefaultCustomerGravatar.png&r=PG"
        },
        status: "TimedOut",
        status_summary: "",
        date_created: "2013-04-10T17:23:55.0000000"
      }
    ],
    displayed_count: 10,
    total_count: 178,
    offset: 0,
    limit: 10,
    sort_dir: "Asc",
    sort_by: "Name"
  }

  app_session_list = BaseSpace::AppSessionList.new(data)

  it 'creates a BaseSpace::AppSessionList object' do
    expect( app_session_list.class ).to eq(BaseSpace::AppSessionList)
  end

  it 'has an array of BaseSpace::AppSession objects' do
    expect( app_session_list.items.class ).to eq(Array)
    expect( app_session_list.items.all? { |app| app.class == BaseSpace::AppSession } ).to eq(true)
  end
end

describe BaseSpace::Sample do
  data = {
    href_genome: "v1pre3/genomes/4",
    sample_number: 1,
    experiment_name: "Genome-in-a-Day",
    href_files: "v1pre3/samples/37037/files",
    app_session: {
      id: "0480cbb3c56135f3f2265f6437ceadf0",
      href: "v1pre3/appsessions/0480cbb3c56135f3f2265f6437ceadf0",
      user_created_by: {
        id: "1001",
        href: "v1pre3/users/1001",
        name: "John Doe"
      },
      status: "Complete",
      status_summary: "",
      date_created: "2012-02-14T07:00:52.0000000"
    },
    is_paired_end: true,
    read1: 0,
    read2: 0,
    num_reads_raw: 0,
    num_reads_pf: 0,
    id: "37037",
    href: "v1pre3/samples/37037",
    user_owned_by: {
      id: "1001",
      href: "v1pre3/users/1001",
      name: "John Doe"
    },
    name: "NA18507",
    sample_id: "ID 1",
    status: "Complete",
    status_summary: "",
    date_created: "2012-02-14T15:04:52.0000000",
    references: [
      {
        rel: "UsedBy",
        type: "AppResult",
        href: "v1pre3/appresults/9675",
        href_content: "v1pre3/appresults/9675",
        content: {
          id: "9675",
          href: "v1pre3/appresults/9675",
          user_owned_by: {
            id: "1001",
            href: "v1pre3/users/1001",
            name: "John Doe"
          },
          name: "Resequencing",
          status: "Complete",
          status_summary: "",
          date_created: "2012-06-01T16:12:00.0000000"
        }
      }
    ]
  }

  sample = BaseSpace::Sample.new(data)

  it 'creates a BaseSpace::Sample object' do
    expect( sample.class ).to eq(BaseSpace::Sample)
  end

  it 'has a BaseSpace::AppSession object attribute' do
    expect( sample.app_session.class ).to eq(BaseSpace::AppSession)
  end

  it 'has a BaseSpace::User object attribute' do
    expect( sample.user_owned_by.class ).to eq(BaseSpace::User)
  end

  it 'has an array attribute of BaseSpace::Reference objects' do
    expect( sample.references.class ).to eq(Array)
    expect( sample.references.all? { |ref| ref.class == BaseSpace::Reference } ).to eq(true)
  end
end

describe BaseSpace::SampleList do
  data = {
    items:[
      {
        id: "194265",
        href: "v1pre3/samples/194265",
        user_owned_by: {
          id: "1003",
          href: "v1pre3/users/1003",
          name: "John Doe"
        },
        name: "sample_72",
        status: "Complete",
        status_summary: "",
        date_created: "2012-08-10T18:32:42.0000000"
      }
    ],
    displayed_count: 3,
    total_count: 3,
    offset: 0,
    limit: 10,
    sort_dir: "Desc",
    sort_by: "Id"
  }

  sample_list = BaseSpace::SampleList.new(data)

  it 'creates a BaseSpace::SampleList object' do
    expect( sample_list.class ).to eq(BaseSpace::SampleList)
  end

  it 'has an array of BaseSpace::Sample objects' do
    expect( sample_list.items.class ).to eq(Array)
    expect( sample_list.items.all? { |sample| sample.class == BaseSpace::Sample } ).to eq(true)
  end
end

describe BaseSpace::AppResult do
  data = {
    description: "Amplicon on sample_1",
    href_files: "v1pre3/appresults/100/files",
    href_genome: "v1pre3/genomes/4",
    app_session: {
      id: "18045d13d368ec128ae0e4b9f6b50873",
      href: "v1pre3/appsessions/18045d13d368ec128ae0e4b9f6b50873",
      user_created_by: {
        id: "1003",
        href: "v1pre3/users/1003",
        name: "Jane Doe"
        },
      status: "Complete",
      status_summary: "",
      date_created: "2011-11-11T03:54:53.0000000"
    },
    references: [
      {
        rel: "Using",
        type: "Sample",
        href: "v1pre3/samples/1100",
        href_content: "v1pre3/samples/1100",
        content: {
          id: "1100",
          href: "v1pre3/samples/1100",
          user_owned_by: {
            id: "1003",
            href: "v1pre3/users/1003",
            name: "Jane Doe"
          },
          name: "sample_1",
          sample_id: "1_1",
          status: "Complete",
          status_summary: "",
          date_created: "2011-11-11T04:41:30.0000000"
        }
      }
    ],
    id: "100",
    href: "v1pre3/appresults/100",
    user_owned_by: {
      id: "1003",
      href: "v1pre3/users/1003",
      name: "Jane Doe"
    },
    name: "Amplicon",
    status: "Complete",
    status_summary: "",
    date_created: "2012-06-01T16:12:00.0000000"
  }

  app_result = BaseSpace::AppResult.new(data)

  it 'creates a BaseSpace::AppResult object' do
    expect( app_result.class ).to eq(BaseSpace::AppResult)
  end

  it 'has a BaseSpace::AppSession object attribute' do
    expect( app_result.app_session.class ).to eq(BaseSpace::AppSession)
  end

  it 'has a BaseSpace::User object attribute' do
    expect( app_result.user_owned_by.class ).to eq(BaseSpace::User)
  end

  it 'has an array attribute of BaseSpace::Reference objects' do
    expect( app_result.references.class ).to eq(Array)
    expect( app_result.references.all? { |ref| ref.class == BaseSpace::Reference } ).to eq(true)
  end
end

describe BaseSpace::AppResultList do
  data = {
    items: [
      {
        id: "731732",
        href: "v1pre3/appresults/731732",
        user_owned_by: {
        id: "2002",
        href: "v1pre3/users/2002",
        name: "BaseSpace Illumina",
        gravatar_url: "https://secure.gravatar.com/avatar/9121a39e2c99fbc80b30fefd5db16168.jpg?s=20&d=https%3a%2f%2fcloud-hoth.illumina.com%2fpublic%2fimages%2fDefaultCustomerGravatar.png&r=PG"
      },
      name: "Picard Aln Metrics for Taq",
      status: "Complete",
      status_summary: "analysis and write-back successful; deleted local files",
      date_created: "2013-06-04T18:23:52.0000000",
      total_size: 72963
      }
    ],
    displayed_count: 1,
    total_count: 1,
    offset: 0,
    limit: 10,
    sort_dir: "Asc",
    sort_by: "Id"
  }

  app_result_list = BaseSpace::AppResultList.new(data)

  it 'creates a BaseSpace::AppResultList object' do
    expect( app_result_list.class ).to eq(BaseSpace::AppResultList)
  end

  it 'has an array attribute of BaseSpace::AppResult objects' do
    expect( app_result_list.items.class ).to eq(Array)
    expect( app_result_list.items.all? { |res| res.class == BaseSpace::AppResult} ).to eq(true)
  end
end

describe BaseSpace::Genome do
  data = {
    display_name: "Phix - Illumina",
    source: "Illumina",
    build: "1.0",
    id: "6",
    species_name: "Phix",
    href: "v1pre3/genomes/6"
  }

  genome = BaseSpace::Genome.new(data)

  it 'creates a BaseSpace::Genome object' do
    expect( genome.class ).to eq(BaseSpace::Genome)
  end
end

describe BaseSpace::GenomeList do
  data = {
    items: [
      {
        id: "6",
        species_name: "Phix",
        href: "v1pre3/genomes/6"
      },
      {
        id: "7",
        species_name: "Rhodobacter sphaeroides",
        href: "v1pre3/genomes/7"
      }
    ],
    displayed_count: 6,
    total_count: 11,
    offset: 5,
    limit: 11,
    sort_dir: "Asc",
    sort_by: "Id"
  }

  genome_list = BaseSpace::GenomeList.new(data)

  it 'creates a BaseSpace::GenomeList object' do
    expect( genome_list.class ).to eq(BaseSpace::GenomeList)
  end

  it 'has an array attribute of BaseSpace::Genome objects' do
    expect( genome_list.items.class ).to eq(Array)
    expect( genome_list.items.all? { |gen| gen.class == BaseSpace::Genome } ).to eq(true)
  end
end







