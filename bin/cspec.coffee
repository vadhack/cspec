path = require('path');
fs = require('fs')
coffee = require('coffee-script')
lib = path.join(path.dirname(fs.realpathSync(__filename)), '../out')
CSpec = require(lib + '/cspec.js').CSpec
commander = require('commander');
commander.version('0.0.4')
         .usage('[options] [spec files]')
         .option('-i, --include <path>', 'Files to include')
         .option('-J, --jquery', 'Include jQuery+DOM')
         .parse(process.argv);

if commander.jquery
  document = require('jsdom').jsdom()
  window = document.createWindow()
  jQuery = require('jquery')
  $ = jQuery

runner = new CSpec()

processInclude = (file) ->
  data = fs.readFileSync process.cwd() + '/' + commander.include + '/' +file
  eval 'with (CSpecGlobal) { ' + coffee.compile(''+data, { bare: true }) + '; for(var variable in exports) { this[variable] = exports[variable]; } }'

if commander.include
  require(lib + '/util.js').forEachCoffeeFileIn commander.include, processInclude, ->
    commander.args.forEach (specFile) ->
      runner.run(specFile)
else
  commander.args.forEach (specFile) ->
    runner.run(specFile)
