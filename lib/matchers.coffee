module.exports.equal = (expected) ->
  self = this
  (actual) ->
    [actual+'' == expected+'', self.outputScope.name + ': ' + actual + ' should equal ' + expected]
