window.Todo =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Todo.Routers.Tasks()
    Backbone.history.start()

$(document).ready ->
  Todo.initialize()
