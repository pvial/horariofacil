class AsignaturasController < ApplicationController
  def indice
    @asignaturas = Asignatura.where(:colegio_id => current_planificador.colegio_id)
    
    render("asignatura_templates/portada_asignaturas.html.erb")
  end
  
  def index
    @cursos = Curso.where(:colegio_id => current_planificador.colegio.id)
    @ramos = Ramo.all
    
    render("asignatura_templates/index.html.erb")
  end

  def index_show
    
    @curso = Curso.find(params.fetch("curso_id"))
    @asignaturas = @curso.asignaturas
    @ramos_id = @asignaturas.pluck(:ramo_id).uniq

    render("asignatura_templates/index_show.html.erb")
  end

  def show
    @asignatura = Asignatura.find(params.fetch("id_to_display"))

    render("asignatura_templates/show.html.erb")
  end

  def new_form
    render("asignatura_templates/new_form.html.erb")
  end

  def create_row
    @asignatura = Asignatura.new

    @asignatura.colegio_id = params.fetch("colegio_id")
    @asignatura.ramo_id = params.fetch("ramo_id")
    @asignatura.nombre = params.fetch("nombre")
    @asignatura.sala_id = params.fetch("sala_id")

    if @asignatura.valid?
      @asignatura.save

      redirect_to("/asignaturas_indice", :notice => "Asignatura created successfully.")
    else
      render("asignatura_templates/new_form.html.erb")
    end
  end

  def edit_form
    @asignatura = Asignatura.find(params.fetch("prefill_with_id"))

    render("asignatura_templates/edit_form.html.erb")
  end

  def update_row
    @asignatura = Asignatura.find(params.fetch("id_to_modify"))

    @asignatura.colegio_id = params.fetch("colegio_id")
    @asignatura.ramo_id = params.fetch("ramo_id")
    @asignatura.nombre = params.fetch("nombre")
    @asignatura.sala_id = params.fetch("sala_id")

    if @asignatura.valid?
      @asignatura.save

      redirect_to("/asignaturas/#{@asignatura.id}", :notice => "Asignatura updated successfully.")
    else
      render("asignatura_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @asignatura = Asignatura.find(params.fetch("id_to_remove"))

    @asignatura.destroy

    redirect_to("/asignaturas", :notice => "Asignatura deleted successfully.")
  end
end
