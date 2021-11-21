class IncomesController < ApplicationController
  before_action :set_target_income:, only: %i[show edit update destroy]

  def index
    @incomes = Income.order(created_at: :asc) 
  end

  def show
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to @income, notice: '収入科目を登録しました'
    else
      render 'new'
    end
  end

  def edit 
  end

  def update
    @income.update(income_params)
    if @income.save
      redirect_to @income, notice: '収入科目を登録しました'
    else
      render 'new'
    end
  end

  def destroy
    @income.destroy
    redirect_to :incomes, notice: '科目を削除しました'
  end
end
private

def income_params
  params.require(:income).permit(:name, :description)
end

def set_target_income
  @income = Income.find(params[:id])
end
