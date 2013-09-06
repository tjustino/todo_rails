class TodoItemsController < ApplicationController
  def index
    @todo_items = TodoItem.all
  end

  def create
    @todo_item = TodoItem.create(todo_item_params)
  end

  def update
    item = TodoItem.find params[:id]
    item.update_attributes todo_item_params
    render nothing: true
  end

  def destroy
    TodoItem.find(params[:id]).destroy
    render nothing: true
  end

  private
    def todo_item_params
      params.require(:todo_item).permit(:completed, :title)
    end
end