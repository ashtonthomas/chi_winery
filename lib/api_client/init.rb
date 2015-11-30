require 'celluloid'

if (Celluloid.group_class != Celluloid::Group::Pool)
  Celluloid.group_class = Celluloid::Group::Pool
  Celluloid.init
end

Kernel::silence_warnings { Imprint::Tracer.const_set('TRACER_HEADER', 'HTTP_X_B3_TRACEID') }

# Load stuff
require_relative 'request'

require_relative 'orders/apis/orders'

require_relative 'wines/apis/wines'
require_relative 'wines/representers/wine_representer'


# Note
# I'm not sure why putting this inside a class doesn't evaluate
# Maybe it has something to do with the different in loading
# between regular lib files and gems/ruby-gems
# so maybe we can rearrange once we put this into a gem
