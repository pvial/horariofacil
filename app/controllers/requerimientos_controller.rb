class RequerimientosController < ApplicationController
  def index
    @requerimientos = Requerimiento.all

    render("requerimiento_templates/index.html.erb")
  end

  def show
    @requerimiento = Requerimiento.find(params.fetch("id_to_display"))

    render("requerimiento_templates/show.html.erb")
  end

  def new_form
    render("requerimiento_templates/new_form.html.erb")
  end

  def create_row
    @requerimiento = Requerimiento.new

    @requerimiento.nivel_id = params.fetch("nivel_id")
    @requerimiento.ramo_id = params.fetch("ramo_id")

    if @requerimiento.valid?
      @requerimiento.save

      redirect_to("/requerimientos", :notice => "Requerimiento created successfully.")
    else
      render("requerimiento_templates/new_form.html.erb")
    end
  end

  def edit_form
    @requerimiento = Requerimiento.find(params.fetch("prefill_with_id"))

    render("requerimiento_templates/edit_form.html.erb")
  end

  def update_row
    @requerimiento = Requerimiento.find(params.fetch("id_to_modify"))

    @requerimiento.nivel_id = params.fetch("nivel_id")
    @requerimiento.ramo_id = params.fetch("ramo_id")

    if @requerimiento.valid?
      @requerimiento.save

      redirect_to("/requerimientos/#{@requerimiento.id}", :notice => "Requerimiento updated successfully.")
    else
      render("requerimiento_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @requerimiento = Requerimiento.find(params.fetch("id_to_remove"))

    @requerimiento.destroy

    redirect_to("/requerimientos", :notice => "Requerimiento deleted successfully.")
  end
end
