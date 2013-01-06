class Todo.Views.Task extends Backbone.View

  template: JST['tasks/task']
  tagName: 'li'

  render: ->
    $(@el).html(@template(task: @model))
    @