# vide la zone de saisie
$('#new-todo').val('')

# on ajoute (append) le même partial dans l'id 'todo-list'
# en sécurisant en cas de code malicieux (escape_javascript)
html = "<%= escape_javascript(render partial: 'todo_item', locals: {item: @todo_item}) %>"
$("#todo-list").append(html)