class TasksController < ApplicationController
  def index
    token = cookies.signed[:todolist_session_token]
    session = Session.find_by(token: token)

    if session
      @tasks = session.user.tasks
      render 'tasks/index'
    else
      render json: { error: 'Not authenticated' }, status: :unauthorized
    end
  end

  def index_by_current_user
    token = cookies.signed[:todolist_session_token]
    session = Session.find_by(token: token)

    if session
      @tasks = session.user.tasks
      render json: {
        tasks: @tasks.as_json(only: %i[id content completed created_at updated_at])
      }
    else
      render json: { tasks: [] }
    end
  end
  # def index_by_current_user
  #   token = cookies.signed[:todolist_session_token]
  #   session = Session.find_by(token: token)
  #
  #   if session
  #     @tasks = session.user.tasks
  #     render 'tasks/index'
  #   else
  #     render json: { tasks: [] }
  #   end
  # end

  def create
    token = cookies.signed[:todolist_session_token]
    session = Session.find_by(token: token)

    if session
      user = session.user
      @task = user.tasks.new(task_params)

      if @task.save
        render 'tasks/create'
      else
        render json: { success: false }
      end
    else
      render json: { success: false }
    end
  end

  def destroy
    token = cookies.signed[:todolist_session_token]
    session = Session.find_by(token: token)

    @task = Task.find_by(id: params[:id])

    if session && session.user.tasks.include?(@task) && @task&.destroy
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def mark_complete
    token = cookies.signed[:todolist_session_token]
    session = Session.find_by(token: token)

    @task = Task.find_by(id: params[:id])

    if session && session.user.tasks.include?(@task) && @task&.update(completed: true)
      render 'tasks/update'
    else
      render json: { success: false }
    end
  end

  def mark_active
    token = cookies.signed[:todolist_session_token]
    session = Session.find_by(token: token)

    @task = Task.find_by(id: params[:id])

    if session && session.user.tasks.include?(@task) && @task&.update(completed: false)
      render 'tasks/update'
    else
      render json: { success: false }
    end
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end
