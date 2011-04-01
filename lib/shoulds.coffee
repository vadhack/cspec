module.exports.should = (matcher) ->
  CSpecGlobal.update matcher this

module.exports.shouldNot = (matcher) ->
  CSpecGlobal.update matcher this
