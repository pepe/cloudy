require 'cloudkit'
require 'rufus/tokyo' 
require 'rufus/tokyo/tyrant' 

@config = YAML.load(File.read('config.yml'))
use CloudKit::Service, :collections => @config['collections'].map(&:to_sym)
use Rack::Session::Pool
puts "* resources on this server: %s" % @config['collections'].join(', ')
