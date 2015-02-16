# require libraries

# require gems
require 'json'
require 'virtus'

# require utils
require_relative 'basespace/utils/keys'
require_relative 'basespace/utils/utils'


# require models and sub-models for response objects
# load non-referencing models first to avoid lazy-finalization
require_relative 'basespace/response/model'
require_relative 'basespace/response/models/application'
require_relative 'basespace/response/models/user'
require_relative 'basespace/response/models/genome'
require_relative 'basespace/response/models/project'
require_relative 'basespace/response/models/run'
require_relative 'basespace/response/models/oauth'
require_relative 'basespace/response/models/reference'
require_relative 'basespace/response/models/app_session'
require_relative 'basespace/response/models/app_result'
require_relative 'basespace/response/models/sample'


# require models for response lists
# load non-referencing models first to avoid lazy-finalization
require_relative 'basespace/response/list'
require_relative 'basespace/response/lists/app_session_list'
require_relative 'basespace/response/lists/project_list'
require_relative 'basespace/response/lists/run_list'
require_relative 'basespace/response/lists/sample_list'
require_relative 'basespace/response/lists/app_result_list'
require_relative 'basespace/response/lists/genome_list'