class ProductsController < ApplicationController
    def new
        if logged_in?
            @product = Product.new
        else
            flash[:alert] = "Debes iniciar sesión para subir productos"
            redirect_to root_path
        end
    end

    def create
        @product = current_user.products.new(name: params[:name], images: params[:images])
        if @product.save
            flash[:notice] = "Producto subido correctamente"
            redirect_to @product
        else
            redirect_to root_path
        end
    end
    def show
        @product = Product.find(params[:id])
        shopping_cart = current_user.shopping_cart
        if !shopping_cart.nil?
            @products = ShoppingCartProduct.where(shopping_cart_id: shopping_cart.id)    
        else
            @products = nil
        end
        @final_price = 0
        @products.each do |product|
            @final_price += product.quantity * product.product.final_price.to_i
        end
    end

end
