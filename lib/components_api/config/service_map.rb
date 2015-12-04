module ServiceMap
  # We need to configure which machines each component is own
  # the process used to construct the ServiceDocument/JsonHome feature will depend on it
  # we could pass this info to the user (internal developer) in the service_document
  # this would allows to easily see which machine needs to be manually scaled (for when we really need to...)

  # this shouldn't deal with the entire URL only the app/machine name
  # our proxy should deal with routing to the correct actual machine..??
  # actually, there is probably a better way with DNS settings - but I'd rather not have another dependency
  # until I really need to (for like live changes with no deploys, etc)

end
