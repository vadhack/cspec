module.exports.equal = (expected) ->
  self = this
  (actual) ->
    [actual+'' == expected+'', self.outputScope.name + ': ' + actual + ' should equal ' + expected]

module.exports.be = module.exports.equal

module.exports.contain = (expected) ->
  self = this
  (actual) ->
    [actual.indexOf(expected) >= 0, self.outputScope.name + ': ' + actual + ' should contain ' + expected]

module.exports.beNil = () ->
  self = this
  (actual) ->
    [!!actual, self.outputScope.name + ': ' + actual + ' should be nil']
