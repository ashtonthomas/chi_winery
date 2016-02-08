require 'celluloid'

if (Celluloid.group_class != Celluloid::Group::Pool)
  Celluloid.group_class = Celluloid::Group::Pool
  Celluloid.init
end

Kernel::silence_warnings { Imprint::Tracer.const_set('TRACER_HEADER', 'HTTP_X_B3_TRACEID') }

# Load stuff
require_relative 'lib/request_router'
require_relative 'lib/is_local_component'

require_relative 'request'

require_relative 'index/api/index_api'

require_relative 'order/api/order_api'

require_relative 'wine/api/wine_api'
require_relative 'wine/api/wine_index_api'
require_relative 'wine/representers/wine_representer'

require_relative 'sugar/api/sugar_api'
require_relative 'sugar/api/sugar_index_api'


# Note
# I'm not sure why putting this inside a class doesn't evaluate
# Maybe it has something to do with the different in loading
# between regular lib files and gems/ruby-gems
# so maybe we can rearrange once we put this into a gem

# maybe we should always load the pact_router
# if test ? mock_everything : mock_only_external
if ENV['RACK_ENV'] == 'test' || ENV['RACK_ENV'] == 'development'
  # Load mocks, override api methods
  # require_relative 'lib/pact_router'
  # require_relative 'wine/pact/wine_api_pact'
end
