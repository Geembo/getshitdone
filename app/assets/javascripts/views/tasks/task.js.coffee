class Todo.Views.Task extends Backbone.View
  tagName: 'li'
  template: JST['tasks/task']
  modal: JST['tasks/modal']

  events:
    'click #delete': 'remove'
    'click #update': 'update'

  render: ->
    $(@el).addClass('task')
    $(@el).html(@template(task: @model))
    $(@el).attr 'data-cid', @model.cid
    @

  remove: ->
  	@model.destroy() if confirm "Are you sure you want to delete #{@model.get('name')}"

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