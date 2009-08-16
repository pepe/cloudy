require "irb/completion"
require "cloudkit"
require "json"
require "rufus-tokyo"
require "ostruct"
require "restclient"

# returns paths to resources on this server
def paths
  @paths ||= fetch('cloudkit-meta')
end

# sets current_path variable for easier accessing one resource
def set_current_path(path)
  @current_path = path
end

# returns OpenStruct created form get to path
def fetch(path = nil)
  to_ostruct(get(sanitize!(path)))
end

# creates from object (which must have to_json) on given paths
def create(object, path = nil)
  to_ostruct(post(sanitize!(path), object.to_json))
end

# creates ostruct from given response
def to_ostruct(response)
  OpenStruct.new(JSON.parse(response))
end

# removes first / from path
def sanitize!(path)
  path = @current_path unless path
  path.sub!(/^\//, '') if path.start_with?('/')
  path += '?limit=10'
  return path
end
