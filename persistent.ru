require 'cloudkit'
require 'rufus/tokyo' 
require 'rufus/tokyo/tyrant' 

config = YAML.load(File.read('config.yml'))
use CloudKit::Service, :collections => config['collections']
CloudKit.setup_storage_adapter(Rufus::Tokyo::Table.new('database.tdb'))
use Rack::Session::Pool
puts "* resources on this server: %s" % config['collections'].join(', ')
