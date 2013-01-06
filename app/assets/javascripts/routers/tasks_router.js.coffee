class Todo.Routers.Tasks extends Backbone.Router
  routes:
    '' : 'index'
    'tasks/:id' : 'show'

  initialize: ->
    @collection = new Todo.Collections.Tasks()
    @collection.fetch()

  index: ->
    view = new Todo.Views.TasksIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Tasks #{id}"
