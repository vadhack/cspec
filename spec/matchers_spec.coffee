assert = require('assert')

describe 'Matchers', ->
  spec ->
    "abc".should contain "a"
  spec ->
    true.should be true
