class TasksController < ApplicationController

    def index
        @newtask = Task.new
        @tasks = Task.all
    end

    def create
        @newtask = Task.create(create_params)
        @newtask.save
        redirect_to :action => "index"
    end

private

    def create_params
        params.require(:task).permit(:name)
    end
end
