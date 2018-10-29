class Api::V1::ReservationsController < ApplicationController

  before_action :set_reservation, only: [:show, :update, :destroy]

  # GET /reservations
  def index
    @rooms = Room.available
    render :json => @rooms.as_json(:only => [:room_number, :daily_rate])
    # render json: {status:'sucess', message:'Loaded rooms',data:@rooms},status: :ok

  end

  def f_price
    if @reservation.user_membership == "yes"
      if @reservation.minibar == "yes"
          (((@room.daily_rate).to_f*(@reservation.day_out - @reservation.day_in).to_f)*0.8) + 20
      else
          (((@room.daily_rate).to_f*(@reservation.day_out - @reservation.day_in).to_f)*0.8)
      end
    else
      if @reservation.minibar == "yes"
          (((@room.daily_rate).to_f*(@reservation.day_out - @reservation.day_in).to_f)*0.8) + 20
      else
          (((@room.daily_rate).to_f*(@reservation.day_out - @reservation.day_in).to_f)*0.8)
      end
    end
  end

  def membership_p
    if @reservation.user_membership == "yes"
    "20%"
    else
    "0"
    end

  end
  # GET /reservations/1
  def show
     render json: @reservation
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created, location: api_v1_reservation_url(@reservation)
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.check == 'out'
      render json: {status: :unprocessable_entity, message:'reservation is already closed'}

        elsif @reservation.update(reservation_update_params)

          response = { :final_price => (f_price),
            :days => (@reservation.day_out - @reservation.day_in).to_i,
            :room_number => @room.room_number,
            :room_rates => @room.daily_rate,
            :discount => membership_p,
            :minibar => @reservation.minibar,
            :status => @reservation.check
            }
          respond_to do |format|
              format.json  { render :json => response }

          end

            else
                render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
      @room = Room.find(@reservation.room_id)
    end

    # Only allow a trusted parameter "white list" through.
    def reservation_params
      params.require(:reservation).permit(:check,:minibar,:user_name,:user_phone,:user_email,:user_membership,:day_in,:day_out,:room_id,:user_name)
    end

    def reservation_update_params
      params.require(:reservation).permit(:check,:minibar)

    end
end
