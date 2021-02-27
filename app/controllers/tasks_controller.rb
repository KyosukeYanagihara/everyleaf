class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  PER = 9

  def index
    if params[:name].present? && params[:status].present?
      @tasks = Task.search_name(params[:name]).search_status(params[:status]).page(params[:page]).per(PER)
    elsif params[:name].present?
      @tasks = Task.search_name(params[:name]).page(params[:page]).per(PER)
    elsif params[:status].present?
      @tasks = Task.search_status(params[:status]).page(params[:page]).per(PER)
    elsif params[:sort_deadline]
      @tasks = Task.sort_deadline.page(params[:page]).per(PER)
    elsif params[:sort_priority]
      @tasks = Task.sort_priority.page(params[:page]).per(PER)
    else
      @tasks = Task.sort_created.page(params[:page]).per(PER)
    end

  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "作成しました" }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :deadline, :status, :priority)
    end
end
