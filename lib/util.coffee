fs = require('fs')

exports.forEachCoffeeFileIn = (directory, fn) ->
  fs.readdir directory, (err, files) ->
    files.forEach (file) ->
      if file.match(/\.coffee$/)
        fn(file)
