class Api::V1::CarsController < ApplicationController
  before_action :authenticate_user!

  def index
    cars = Car.order('created_at DESC')
    render json: { cars: cars }, status: :ok
  end

  def create
    car = Car.new(car_params)
    if car.save
      render json: { car: car }, status: :ok
    else
      render json: { msg: 'Falha na inclusão do veiculo' }, status: :unprocessable_entity
    end
  end

  def show
    car = Car.find(params[:id])
    if car.present?
      render json: { car: car }, status: :ok
    else
      render json: { msg: 'Veiculo não localizado !!!' }, status: :unprocessable_entity
    end
  end

  def update
    car = Car.find(params[:id])
    if car.update_attributes(car_params)
      render json: { car: car }, status: :ok
    else
      render json: { msg: 'Falha na atualização do veiculo '}, status: :unprocessable_entity
    end
  end

  def destroy
    car = Car.find(params[:id])
    if car.destroy
      render json: { msg: 'Veiculo excluido com sucesso !!' }, status: :ok
    else
      render json: { msg: 'Falha na exclusão do veiculo !'}, status: :unprocessable_entity
    end
  end

  private
    def car_params
      params.permit(:marca, :veiculo, :ano, :descricao, :vendido)
    end
end
