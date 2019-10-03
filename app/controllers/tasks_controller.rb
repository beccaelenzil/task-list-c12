TASKS = [{name: "learn rails", description: "learn rails", due_date: "01.01.2020"}]

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    #task_id = params[:id]
    #@task = Task.find_by(id: task_id)
    @task = TASKS[0]
  end
end
