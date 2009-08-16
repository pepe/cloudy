require "irb/completion"
require "cloudkit"
require "json"
require "rufus-tokyo"
require "ostruct"
require "restclient"

# returns paths to resources on this server
def paths
  fetch('cloudkit-meta')
end

# returns OpenStruct created form get to path
def fetch(path)
  sanitize(path)
  to_ostruct(get(path))
end

# creates from object (which must have to_json) on given paths
def create(object, path)
  sanitize(path)
  to_ostruct(post(path, object.to_json))
end

# creates ostruct from given response
def to_ostruct(response)
  OpenStruct.new(JSON.parse(response))
end

# removes first / from path
def sanitize(path)
  path.sub!(/^\//, '') if path.start_with?('/')
end
