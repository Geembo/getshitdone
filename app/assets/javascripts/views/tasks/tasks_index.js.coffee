class Todo.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']

  events:
    'submit #add-task': 'createTask'
    'mousedown .task': 'drag'

  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @appendTask, @)
    @collection.on('destroy', @render, @)
    @collection.on('change', @render, @)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendTask)
    @

  appendTask: (task) ->
    view = new Todo.Views.Task(model: task)
    if task.get('status') is 'queue'
      $('#queue-tasks').append(view.render().el)
    else if task.get('status') is 'doing'
      $('#doing-tasks').append(view.render().el)
    else if task.get('status') is 'done'
      $('#done-tasks').append(view.render().el)
    $('.task').disableSelection()

  drag: ->
    tasks = @collection
    $('.task').draggable
      helper: 'clone'
    $('.doing').droppable
      hoverClass: "drop-hover"
      drop: (event, ui)->
        task = tasks.get $(ui.draggable).data('cid')
        if task.get('status') isnt 'doing'
          task.save 'status': 'doing'
          $(ui.draggable).remove()

    $('.done').droppable
      hoverClass: "drop-hover"
      drop: (event, ui)->
        task = tasks.get $(ui.draggable).data('cid')
        if task.get('status') isnt 'done'
          task.save 'status': 'done' 
          $(ui.draggable).remove()

    $('.queue').droppable
      hoverClass: "drop-hover"
      drop: (event, ui)->
        task = tasks.get $(ui.draggable).data('cid')
        if task.get('status') isnt 'queue'
          task.save 'status': 'queue' 
          $(ui.draggable).remove()

  createTask: (event) ->
    event.preventDefault()
    attributes = 
      name: $('#new-task').val()
      status: 'queue'
    @collection.create attributes,
      wait: true
      success: -> $('#add-task')[0].reset()
      error: @handleError

  handleError: (task, response)->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages