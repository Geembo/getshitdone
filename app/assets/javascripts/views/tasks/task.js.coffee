class Todo.Views.Task extends Backbone.View

  template: JST['tasks/task']
  tagName: 'li'

  events:
    'click #delete': 'remove'

  initialize: ->
    @model.on('destroy', @render, @)

  render: ->
    $(@el).html(@template(task: @model))
    @

  remove: ->
    @model.destroy()