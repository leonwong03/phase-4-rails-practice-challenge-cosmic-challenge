class ScientistsController < ApplicationController

    def index
        scientists = Scientist.all
        render json: scientists, status: :ok
    end

    def show
        scientist = Scientist.find_by(id: params[:id])
        if scientist
            render json: scientist, serializer: ShowScientistSerializer, status: :ok
        else
            render json: { error: "Scientist not found" }, status: :not_found
        end
    end

    def create
        scientist = Scientist.create(name: params[:name], field_of_study: params[:field_of_study], avatar: params[:avatar])
        if scientist.valid?
            render json: scientist, status: :created
        else
            render json: { errors: scientist.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        scientist = Scientist.find_by(id: params[:id])
        if scientist
            scientist.update(scientist_params)
            if scientist.valid?
                render json: scientist, status: :accepted
            else
                render json: { errors: scientist.errors.full_messages }, status: :unprocessable_entity
            end
        else
            render json: { error: "Scientist not found" }, status: :not_found
        end
    end

    def destroy
        scientist = Scientist.find_by(id: params[:id])
        if scientist
            scientist.destroy
            render json: {}, status: :no_content
        else
            render json: { error: "Scientist not found" }, status: :not_found
        end
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end
end