class ModulosController < ApplicationController
  def index
    @modulos = Modulo.all

    render("modulo_templates/index.html.erb")
  end

  def show
    @modulo = Modulo.find(params.fetch("id_to_display"))

    render("modulo_templates/show.html.erb")
  end

  def new_form
    render("modulo_templates/new_form.html.erb")
  end

  def create_row
    @modulo = Modulo.new

    @modulo.curso_id = params.fetch("curso_id")
    @modulo.dia_id = params.fetch("dia_id")
    @modulo.activo = params.fetch("activo")
    @modulo.posicion = params.fetch("posicion")

    if @modulo.valid?
      @modulo.save

      redirect_to("/modulos", :notice => "Modulo created successfully.")
    else
      render("modulo_templates/new_form.html.erb")
    end
  end

  def edit_form
    @modulo = Modulo.find(params.fetch("prefill_with_id"))

    render("modulo_templates/edit_form.html.erb")
  end

  def update_row
    @modulo = Modulo.find(params.fetch("id_to_modify"))

    @modulo.curso_id = params.fetch("curso_id")
    @modulo.dia_id = params.fetch("dia_id")
    @modulo.activo = params.fetch("activo")
    @modulo.posicion = params.fetch("posicion")

    if @modulo.valid?
      @modulo.save

      redirect_to("/modulos/#{@modulo.id}", :notice => "Modulo updated successfully.")
    else
      render("modulo_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @modulo = Modulo.find(params.fetch("id_to_remove"))

    @modulo.destroy

    redirect_to("/modulos", :notice => "Modulo deleted successfully.")
  end
end
