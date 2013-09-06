# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
toggleItem = (elem) ->
  $li = $(elem).closest('li').toggleClass("completed")
  id = $li.data 'id'

  data = "todo_item[completed]=#{elem.checked}"
  url = "/todo_items/#{id}"
  $.ajax
    type: 'PATCH'
    url: url
    data: data

destroyItem = (elem) ->
  $li = $(elem).closest('li')
  id = $li.data 'id'
  url = "/todo_items/#{id}"
  $.ajax
    url: url
    type: 'DELETE'
    success: -> $li.remove()

$ ->
  $("#todo-list").on 'change', '.toggle', (e) -> toggleItem e.target
  $("#todo-list").on 'click', '.destroy', (e) -> destroyItem e.target