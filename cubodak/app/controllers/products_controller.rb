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
    end

end
