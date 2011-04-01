sys = require('sys')
fs = require('fs')
coffee = require('coffee-script')
Commands = require('./commands')

mixin = (target, src) ->
  target[method] = action for method, action in src

mixin CSpec, Commands

class CSpec
  constructor: ->
    @output = { children: [] }
    @outputScope = @output
    @latestOutput = ""

  run: ->
    fs.readdir "./test", (err, files) ->
      files.forEach (file) ->
        fs.readFile file, (err, data) ->
          coffee.run data, { bare: true }
          sys.print @latestOutput

module.exports.CSpec = CSpec
