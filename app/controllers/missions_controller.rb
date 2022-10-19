class MissionsController < ApplicationController

    def create #post

        mission = Mission.create(name: params[:name], scientist_id: params[:scientist_id], planet_id: params[:planet_id])
        if mission.valid?
            render json: mission.planet, status: :created
        else
            render json: { errors: mission.errors.full_messages }, status: :unprocessable_entity
        end
    end

end
