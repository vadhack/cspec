sys = require 'child_process'
fs = require 'fs'

task 'compile', (options) ->
  sys.exec 'coffee -o ./out/ -c ./lib/*.coffee'
  sys.exec 'coffee -b -o ./bin/ -c ./bin/*.coffee'

task 'spec', ->
  appendSpec = (f) -> "spec/#{f}"
  fs.readdir 'spec', (err, files) ->
    sys.exec "bin/cspec #{files.map(appendSpec).join(' ')}", (err, stdout, stderr) ->
      require("util").print stdout

