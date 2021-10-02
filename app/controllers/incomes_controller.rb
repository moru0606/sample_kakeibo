class IncomesController < ApplicationController

  def index
    @incomes = Income.order(created_at: :asc) 
  end

  def show
    @income = Income.find(params[:id])
  end

  def new
    @income = Income.new
  end

  def edit 
    @income = Income.find(params[:id])
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to @income, notice: '収入科目を登録しました'
    else
      render 'new'
    end
  end

  def update
    @income = Income.find(params[:id])
    @income.update(income_params)
    if @income.save
      redirect_to @income, notice: '収入科目を登録しました'
    else
      render 'new'
    end
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to :incomes, notice: '科目を削除しました'
  end
end
private

def income_params
  params.require(:income).permit(:name, :description)
end
