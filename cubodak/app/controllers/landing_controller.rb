class LandingController < ApplicationController
    def index
        @products = Product.limit(10)
    end
end