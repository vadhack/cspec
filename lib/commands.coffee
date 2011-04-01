class Commands
  it: (fn) ->
    try
      fn()
    catch e
      @errors.push e

  describe: (name, fn) ->
    newScope = { name: name, children: [] }
    @outputScope.children.push newScope
    @outputScope = newScope
    fn()

  context: (name, fn) -> @describe name, fn

module.exports.Commands = Commands
