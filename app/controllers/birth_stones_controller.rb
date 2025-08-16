class BirthStonesController < ApplicationController
  def show
    @month = params[:month].to_i
    
    # Handle invalid month parameter
    unless @month.between?(1, 12)
      flash[:alert] = "Invalid month selected. Please choose a month between 1 and 12."
      redirect_to root_path
      return
    end
    
    @birth_stone = BirthStone.find_by_month(@month)
    
    # Handle missing birth stone data
    unless @birth_stone
      flash[:alert] = "Birth stone data not found for the selected month. Please try again."
      redirect_to root_path
      return
    end
  end

  def create
    month = params[:month].to_i
    day = params[:day].to_i
    
    # Validate month (1-12) and day (1-31)
    if month.between?(1, 12) && day.between?(1, 31)
      redirect_to birth_stone_show_path(month: month)
    else
      flash[:alert] = "Please select a valid month (1-12) and day (1-31)"
      redirect_to root_path
    end
  end
end
