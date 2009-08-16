require 'cloudkit'
require 'rufus/tokyo' 
require 'rufus/tokyo/tyrant' 

collections = [:lists]
CloudKit.setup_storage_adapter(Rufus::Tokyo::Table.new('database.tdb'))
use CloudKit::Service, :collections => collections
use Rack::Session::Pool
puts "* resources on this server:%s " % collections.join(', ')
