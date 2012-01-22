fs = require('fs')

exports.forEachCoffeeFileIn = (directory, fn, completedFn) ->
  fs.readdir directory, (err, files) ->
    files.forEach (file) ->
      if file.match(/\.coffee$/)
        fn(file)
    completedFn?()
