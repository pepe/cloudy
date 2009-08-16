require 'cloudkit'
require 'rufus/tokyo' 
require 'rufus/tokyo/tyrant' 

collections = [:lists]
use Rack::Session::Pool
puts "* resources on this server: %s" % collections.join(', ')
