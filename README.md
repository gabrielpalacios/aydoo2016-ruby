# aydoo2016-ruby
Repositorio Proyecto Factores Primos v3
Utilizando subcarpeta ahora

No pude implementar un rspec para Program, por lo visto en:
http://stackoverflow.com/questions/7077026/unable-to-use-optionparser-and-rspec

You cannot use rspec with OptionParser since the rspec executable itself parses its own options. You cannot "piggy back" your options on the rspec options.
If you must do something like this then use either a settings file (spec_config.yml or similar), or use an environment variable:
BROWSER=firefox spec test_something.rb
And then in your code you can use ENV['BROWSER'] to retrieve the setting.
