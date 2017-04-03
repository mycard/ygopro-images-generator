# This is a test file.

def unit_test1
  require './Sqlite.rb'
  data = Sqlite.load
  require './MSETranslator.rb'
  MSETranslator.generate_mse(data)
end

def unit_test2
  # remember to delete files under mse-sets\ first.
  # That will be added later
  require './Sqlite.rb'
  Global.language = 'jp'
  data = Sqlite.split Sqlite.load
  data = [data[1]]
  require './MSETranslator.rb'
  MSETranslator.generate_mse_all(dataw)
end

def unit_test3
  require './MSETranslator.rb'
  MSETranslator.export_mse_all
end

def unit_test_god
  require './Commands.rb'
  Global.language = 'en-US'
  p MSETranslator.split_effect YGOCoreJudgers.get_desc(Sqlite.load(17390179)[0])
end

unit_test_god
