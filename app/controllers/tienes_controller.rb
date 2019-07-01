class TienesController < ApplicationController
  def index
    @tienes = Tiene.all

    render("tiene_templates/index.html.erb")
  end

  def show
    @tiene = Tiene.find(params.fetch("id_to_display"))

    render("tiene_templates/show.html.erb")
  end

  def new_form
    render("tiene_templates/new_form.html.erb")
  end

  def create_row
    @tiene = Tiene.new
    
    curso = params.fetch("curso_id")
    pos = params.fetch("posicion")
    dia = params.fetch("dia_id")
    modulo = Curso.find(curso).modulos.where(:dia_id => dia).where(:posicion => pos).last.id
  
    @tiene.modulo_id = modulo
    @tiene.asignatura_id = params.fetch("asignatura_id")

    if @tiene.valid?
      @tiene.save

    redirect_back fallback_location: "/"
    
    else
      redirect_to("/cursos/#{curso}", :notice => "Restricción ya existe.")
    end
  end

  def edit_form
    @tiene = Tiene.find(params.fetch("prefill_with_id"))

    render("tiene_templates/edit_form.html.erb")
  end

  def update_row
    @tiene = Tiene.find(params.fetch("id_to_modify"))

    @tiene.modulo_id = params.fetch("modulo_id")
    @tiene.asignatura_id = params.fetch("asignatura_id")

    if @tiene.valid?
      @tiene.save

      redirect_to("/tienes/#{@tiene.id}", :notice => "Tiene updated successfully.")
    else
      render("tiene_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @tiene = Tiene.find(params.fetch("id_to_remove"))

    @tiene.destroy

    redirect_to("/tienes", :notice => "Tiene deleted successfully.")
  end
end
