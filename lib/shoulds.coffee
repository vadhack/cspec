module.exports.should = (matcher) ->
  CSpecGlobal.update matcher this

module.exports.shouldNot = (matcher) ->
  result = matcher this
  matcher.success = !matcher.success
  CSpecGlobal.update result
