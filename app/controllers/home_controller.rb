class HomeController < ApplicationController
  def index
    @items = QiitaItem.get
  end
end
