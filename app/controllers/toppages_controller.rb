class ToppagesController < ApplicationController
  def index
    @teachers = Teacher.all.recent
  end
end
