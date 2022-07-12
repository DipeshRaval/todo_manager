# todos_controller.rb
class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
    render "index"
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

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: "Updated todo completed status to #{completed} for todo id : #{todo.id}"
  end
end
