class ProceduresController < ApplicationController
  before_action :set_procedure, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @procedures = Procedure.all
    respond_with(@procedures)
  end

  def show
    respond_with(@procedure)
  end

  def new
    @procedure = Procedure.new
    respond_with(@procedure)
  end

  def edit
  end

  def create
    @procedure = Procedure.new(procedure_params)
    @procedure.save
    respond_with(@procedure)
  end

  def update
    @procedure.update(procedure_params)
    respond_with(@procedure)
  end

  def destroy
    @procedure.destroy
    respond_with(@procedure)
  end

  private
    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    def procedure_params
      params.require(:procedure).permit(:name, :slug, :category)
    end
end
