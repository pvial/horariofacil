class SolProvesController < ApplicationController
  def index
    @sol_proves = SolProfe.all

    render("sol_profe_templates/index.html.erb")
  end

  def show
    @sol_profe = SolProfe.find(params.fetch("id_to_display"))

    render("sol_profe_templates/show.html.erb")
  end

  def new_form
    render("sol_profe_templates/new_form.html.erb")
  end

  def create_row
    @sol_profe = SolProfe.new

    @sol_profe.solucion_id = params.fetch("solucion_id")
    @sol_profe.posicion = params.fetch("posicion")
    @sol_profe.asignatura_id = params.fetch("asignatura_id")

    if @sol_profe.valid?
      @sol_profe.save

      redirect_to("/sol_proves", :notice => "Sol profe created successfully.")
    else
      render("sol_profe_templates/new_form.html.erb")
    end
  end

  def edit_form
    @sol_profe = SolProfe.find(params.fetch("prefill_with_id"))

    render("sol_profe_templates/edit_form.html.erb")
  end

  def update_row
    @sol_profe = SolProfe.find(params.fetch("id_to_modify"))

    @sol_profe.solucion_id = params.fetch("solucion_id")
    @sol_profe.posicion = params.fetch("posicion")
    @sol_profe.asignatura_id = params.fetch("asignatura_id")

    if @sol_profe.valid?
      @sol_profe.save

      redirect_to("/sol_proves/#{@sol_profe.id}", :notice => "Sol profe updated successfully.")
    else
      render("sol_profe_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @sol_profe = SolProfe.find(params.fetch("id_to_remove"))

    @sol_profe.destroy

    redirect_to("/sol_proves", :notice => "Sol profe deleted successfully.")
  end
end
