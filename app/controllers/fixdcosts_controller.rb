class FixdcostsController < ApplicationController
  def index
    @fixdcosts = Fixdcost.order(created_at: :asc)
  end

  def show
    @fixdcost = Fixdcost.find(params[:id])
  end
  
  def new
    @fixdcost = Fixdcost.new
  end

  def create
    @fixdcost = Fixdcost.new(fixdcost_params)
    if @fixdcost.save
      redirect_to @fixdcost, notice: '固定費を登録しました'
    else
      redirect_to 'new'
    end
  end

  def edit
    @fixdcost = Fixdcost.find(params[:id])
  end

  def update
    @fixdcost = Fixdcost.find(params[:id])
    if @fixdcost.update(fixdcost_params)
      redirect_to @fixdcost, notice: '固定費を登録しました'
    else
      redirect_to 'new'
    end

    def destroy
      @fixdcost = Fixdcost.find(params[:id])
      @fixdcost.destroy
      redirect_to :fixdcosts, notice: '科目を削除しました'
    end
  end
end

private
def fixdcost_params
  params.require(:fixdcost).permit(:name, :description)
end
