class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(name: :desc)
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)
    if @monster.save
      redirect_to @monster, notice: "Se ha creado el Monstruo correctamente!"
    else
      render :new
    end
  end

  def edit
    @monster = Monster.find(params[:id])
  end

  def update
    @monster = Monster.find(params[:id])
    if @monster.update(monster_params)
      redirect_to @monster, notice: "Se ha actualizado el Monstruo correctamente!"
    else
      render :edit
    end
  end

  def show
    @monster = Monster.find(params[:id])
  end

  private 
  def monster_params
    params.require(:monster).permit(:name, :description, :phone, :birthdate)
  end
  

end
