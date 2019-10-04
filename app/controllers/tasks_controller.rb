TASKS = [{name: "learn rails", description: "learn rails", due_date: "01.01.2020"}]

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      redirect_to tasks_path
      flash[:error] = "Could not find task with id: #{params[:id]}"
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description], due_date: params[:task][:due_date]) #instantiate a new task
    if @task.save # save returns true if the database insert succeeds
      redirect_to task_path(@task) # go to the index so we can see the book in the list
      return
    else # save failed :(
      render :new # show the new book form view again
      return
    end
  end

end
