class TasksController < ApplicationController
  respond_to :json
  before_filter :authorize
  
  def index
    respond_with Task.where(user_id: session[:user_id])
  end
  def show
    respond_with Task.find(params[:id])
  end
  def create
    respond_with Task.create(name: params[:task][:name], 
                           status: params[:task][:status],
                           user_id: params[:user_id])
  end
  def update
    respond_with Task.update(params[:id], params[:task])
  end
  def destroy
    respond_with Task.destroy(params[:id])
  end
end
