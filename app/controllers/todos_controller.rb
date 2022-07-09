# todos_controller.rb
class TodosController < ApplicationController
  def index
    render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    new_todo = Todo.create(todo_text: todo_text, due_date: DateTime.parse(due_date), completed: false)
    rendered_text = "The new todo created with the id : #{new_todo.id}"
    render plain: rendered_text
  end
end
