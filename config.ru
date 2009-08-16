require 'cloudkit'
require 'rufus/tokyo' 
require 'rufus/tokyo/tyrant' 

collections = [:lists]
use CloudKit::Service, :collections => collections
use Rack::Session::Pool
puts "* resources on this server: %s" % collections.join(', ')
