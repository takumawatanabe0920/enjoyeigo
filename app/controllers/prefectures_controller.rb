class PrefecturesController < ApplicationController
  def search
    if params[:l_cat]
      @m_cat = Prefecture.find(params[:l_cat]).children
    else
      @s_cat = Prefecture.find(params[:m_cat]).children
    end
    respond_to do |format|
      format.html
      format.json
    end
  end
end
