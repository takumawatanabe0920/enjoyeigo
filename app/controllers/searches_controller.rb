class SearchesController < ApplicationController
  def index
    @q = Teacher.ransack(params[:q])
    @teachers = @q.result
    @prefectures = Prefecture.all

  end
end
