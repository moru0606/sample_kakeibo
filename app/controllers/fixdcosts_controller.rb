class FixdcostsController < ApplicationController
  before_action :set_target_fixdcost, only: %i[show edit update destroy]
  
  def index
    @fixdcosts = Fixdcost.order(created_at: :asc)
  end

  def show
  end
  
  def new
    @fixdcost = Fixdcost.new
  end

  def create
    @fixdcost = Fixdcost.new(fixdcost_params)
    if @fixdcost.save
      redirect_to @fixdcost, notice: '固定費を登録しました'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @fixdcost.update(fixdcost_params)
      redirect_to @fixdcost, notice: '固定費を登録しました'
    else
      render 'new'
    end

    def destroy
      @fixdcost.destroy
      redirect_to :fixdcosts, notice: '科目を削除しました'
    end
  end
end

private
def fixdcost_params
  params.require(:fixdcost).permit(:name, :description)
end

def set_target_fixdcost
  @fixdcost = Fixdcost.find(params[:id])
end
