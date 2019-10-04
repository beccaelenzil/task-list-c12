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
    @task = Task.new(name: params[:task][:name], description: params[:task][:description], due_date: params[:task][:due_date], completion_date: nil) #instantiate a new task
    if @task.save # save returns true if the database insert succeeds
      redirect_to task_path(@task) # go to the index so we can see the task in the list
      return
    else # save failed :(
      render :new # show the new task form view again
      return
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    @task.update(name: params[:task][:name], description: params[:task][:description], due_date: params[:task][:due_date], completion_date: nil)

    if @task.save # save returns true if the database insert succeeds
      redirect_to tasks_path # go to the index so we can see the task in the list
      return
    else # save failed :(
      render :edit # show the new task form view again
      return
    end
  end

  def destroy
    task_id = params[:id]
    @task = Task.find_by(id:task_id)

    if @task.nil?
      head :not_found
      return
    end

    @task.destroy

    redirect_to tasks_path
  end

  def mark_complete
    task_id = params[:id]
    @task = Task.find_by(id:task_id)

    puts "task: #{@task}" 

    if @task.nil?
      head :not_found
      return
    end

    @task.completion_date = Time.now
    @task.save

    redirect_to tasks_path
  end

  def mark_incomplete
    task_id = params[:id]
    @task = Task.find_by(id:task_id)

    if @task.nil?
      head :not_found
      return
    end

    @task.completion_date = nil
    @task.save

    redirect_to tasks_path
  end



end
