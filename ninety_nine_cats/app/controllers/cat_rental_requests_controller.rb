class CatRentalRequestsController < ApplicationController

    def new 
        @cats = Cat.all
        @request = CatRentalRequest.new
        render :new
    end

    def create 
        @request = CatRentalRequest.new(request_params)
        if @request.save 
            render plain: 'request submitted'
        else 
            render :new 
        end 
    end

    # def show 
    #     @request =
    # end 

end