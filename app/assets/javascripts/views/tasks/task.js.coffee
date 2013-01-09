class Todo.Views.Task extends Backbone.View

  template: JST['tasks/task']
  tagName: 'li'

  events:
    'click #delete': 'remove'
    'click span': 'edit'
    'click #update': 'update'

  initialize: ->
    this.$el.attr( "id", "task" )

  render: ->
    $(@el).html(@template(task: @model))
    @

  remove: ->
    @model.destroy()

  edit: (event) ->
      $('').toggle()
      $('#edit-task').toggle()
      $('#edit-task').focus()

  update: (event) ->
    event.preventDefault()
    title = $('#edit-task').val().trim()
    @model.set(name: title)
    @model.save()

  handleError: (task, response)->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages