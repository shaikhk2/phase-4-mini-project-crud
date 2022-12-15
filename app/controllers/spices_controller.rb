class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices
    end

    # def show 
    #     spice = Spice.find_by( id: params[:id] )
    #     if spice
    #         render json: spice
    #     else 
    #         render json: { error: "Spice not found" }, status: 404
    #     end
    # end

    def create 
        create_spice = Spice.create( spice_params )
        render json: create_spice, status: :created
    end

    def update 
        update_spice = Spice.find_by( id: params[:id] )
        if update_spice
            update_spice.update( spice_params )
            #ask about status: :ok
            render json: update_spice, status: :ok
        else
            render json: { error: "Spice not found" }, status: 404
        end
    end

    def destroy
        destroy_spice = Spice.find_by( id: params[:id] )
        if destroy_spice
            destroy_spice.destroy
            head :no_content
        else 
            render json: { error: "Spice not found" }, status: 404
        end
    end

    private
        def spice_params
            params.permit( :title, :image, :description, :notes, :rating )
        end
end
