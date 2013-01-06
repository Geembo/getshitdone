class Todo.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']

  initialize: ->
    @collection.on('reset', @render, @)

  render: ->
    $(@el).html(@template(tasks: @collection))
    @