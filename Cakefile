sys = require 'child_process'
fs = require 'fs'

task 'compile', (options) ->
  sys.exec 'coffee -o ./out/ -c ./lib/*.coffee'

task 'spec', ->
  fs.readdir 'spec', (err, files) ->
    require("util").print "bin/cspec -i lib #{files.join(' ')}"

