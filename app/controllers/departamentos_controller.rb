class DepartamentosController < ApplicationController
  def index
    @departamentos = Departamento.where(:colegio_id => current_planificador.colegio_id)

    render("departamento_templates/index.html.erb")
  end

  def show
    @departamento = Departamento.find(params.fetch("id_to_display"))

    render("departamento_templates/show.html.erb")
  end

  def new_form
    render("departamento_templates/new_form.html.erb")
  end

  def create_row
    @departamento = Departamento.new

    @departamento.colegio_id = params.fetch("colegio_id")
    @departamento.nombre = params.fetch("nombre")

    if @departamento.valid?
      @departamento.save

      redirect_to("/departamentos", :notice => "Departamento created successfully.")
    else
      render("departamento_templates/new_form.html.erb")
    end
  end

  def edit_form
    @departamento = Departamento.find(params.fetch("prefill_with_id"))

    render("departamento_templates/edit_form.html.erb")
  end

  def update_row
    @departamento = Departamento.find(params.fetch("id_to_modify"))

    @departamento.colegio_id = params.fetch("colegio_id")
    @departamento.nombre = params.fetch("nombre")

    if @departamento.valid?
      @departamento.save

      redirect_to("/departamentos/#{@departamento.id}", :notice => "Departamento updated successfully.")
    else
      render("departamento_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @departamento = Departamento.find(params.fetch("id_to_remove"))

    @departamento.destroy

    redirect_to("/departamentos", :notice => "Departamento deleted successfully.")
  end
end
