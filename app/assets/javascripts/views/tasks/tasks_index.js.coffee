class Todo.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']

  events:
    'submit #add-task': 'createTask'

  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @appendTask, @)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendTask)
    @

  appendTask: (task) ->
    view = new Todo.Views.Task(model: task)
    $('#tasks').append(view.render().el)

  createTask: (event) ->
    event.preventDefault()
    attributes = name: $('#new-task').val(),
    @collection.create attributes,
      success: -> $('#add-task')[0].reset()
      error: @handleError

  handleError: (task, response)->
    if response.status == 422
      console.log "error message"
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages