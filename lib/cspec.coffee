sys = require('util')
fs = require('fs')
style = require('colors')

coffee = require('coffee-script')
commands = require('./commands')
matchers = require('./matchers')
shoulds = require('./shoulds')

Object.prototype.should = shoulds.should
Object.prototype.shouldNot = shoulds.shouldNot

class CSpec
  constructor: ->
    @output = { children: [] }
    @outputScope = @output
    @latestOutput = ""
    @errors = []

    this[name] = action for name, action of commands
    this[name] = action for name, action of matchers
    `CSpecGlobal = this`

  run: ->
    fs.readdir "./spec", (err, files) ->
      files.forEach (file) ->
        if file.match /\.coffee$/
          fs.readFile './spec/'+file, (err, data) ->
            eval 'with (CSpecGlobal) {' + coffee.compile(''+data, { bare: true }) + '}'

  update: (matcherResult) ->
    [passed, message] = matcherResult
    message = if passed then message.green else message.red
    sys.puts message

module.exports.CSpec = CSpec
