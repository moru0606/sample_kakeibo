class VariablecostsController < ApplicationController
  before_action :set_target_variablecost, only: %i[show edit update destroy]

  def index
    @variablecosts = Variablecost.order(created_at: :asc)
  end

  def show; end

  def new
    @variablecost = Variablecost.new
  end

  def create
    @variablecost = Variablecost.new(variablecost_params)
    if @variablecost.save
      redirect_to @variablecost, notice: '変動費科目を登録しました '
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @variablecost.update(variablecost_params)
      redirect_to @variablecost, notice: '変動費科目を登録しました'
    else
      render 'new'
    end
  end

  def destroy
    @variablecost.destroy
    redirect_to :variablecosts, notice: '科目を削除しました'
  end
end

private

def variablecost_params
  params.require(:variablecost).permit(:name, :description)
end

def set_target_variablecost
  @variablecost = Variablecost.find(params[:id])
end
