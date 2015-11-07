require 'celluloid'

if (Celluloid.group_class != Celluloid::Group::Pool)
  Celluloid.group_class = Celluloid::Group::Pool
  Celluloid.init
end

Kernel::silence_warnings { Imprint::Tracer.const_set('TRACER_HEADER', 'HTTP_X_B3_TRACEID') }
