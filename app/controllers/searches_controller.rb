class SearchesController < ApplicationController
  def index
    @q = Teacher.ransack(params[:q])
    @teachers = @q.result(distinct: true).recent.page(params[:page])
  end
end
