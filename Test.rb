# This is a test file.

def unit_test1
  require './Sqlite.rb'
  data = Sqlite.load
  require './MSETranslator.rb'
  MSETranslator.generate_mse(data)
end

def unit_test2
  require './Sqlite.rb'
  Global.language = 'cn'
  data = Sqlite.split Sqlite.load
  data = [data[10]]
  require './MSETranslator.rb'
  MSETranslator.generate_mse_all(data)
end

def unit_test3
  require './MSETranslator.rb'
  MSETranslator.export_mse_all
end

unit_test3