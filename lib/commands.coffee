module.exports.it = it = (fn) ->
  try
    fn()
  catch e
    throw e

module.exports.describe = describe = (name, fn) ->
  newScope = { name: name, children: [] }
  @outputScope.children.push newScope
  @outputScope = newScope
  fn()

module.exports.context = (name, fn) -> describe name, fn
module.exports.spec = (fn) -> it fn
