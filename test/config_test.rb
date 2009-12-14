# Grab the present directory
plugin_test_dir = File.dirname(__FILE__)

# Load the Rails environment
require ENV['environment'] || File.join(plugin_test_dir, '../../../../config/environment')

# Method to decide which db adapter to use. If none is discovered, then it tries to use sqlite.
def db_adapter
  result = ENV['DB'] 
  result ||= 
  begin
    require 'rubygems'
    require 'sqlite'
    'sqlite'
  rescue MissingSourceFile
    begin
      require 'sqlite3'
      'sqlite3'
    rescue MissingSourceFile
    end
  end
  raise "No DB Adapter selected.  Pass the DB= option to pick one, or install Sqlite or Sqlite3." if result.nil?
  result
end

# Load database configs from plugin test directory
databases = YAML::load(IO.read(plugin_test_dir + '/database.yml'))

# Add error log to the plugin test directory
ActiveRecord::Base.logger = Logger.new(plugin_test_dir + "/debug.log")

# Establish connection to one of the specified database configs that correlates to the rails app's db adapter preference.
ActiveRecord::Base.establish_connection(databases[db_adapter])

# Load the test schema into the database
load(File.join(plugin_test_dir, 'schema.rb'))