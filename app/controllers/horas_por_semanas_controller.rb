class HorasPorSemanasController < ApplicationController
  def index
    @horas_por_semanas = HorasPorSemana.all

    render("horas_por_semana_templates/index.html.erb")
  end

  def show
    @horas_por_semana = HorasPorSemana.find(params.fetch("id_to_display"))

    render("horas_por_semana_templates/show.html.erb")
  end

  def new_form
    @curso = Curso.find(params.fetch("curso_id"))
    render("horas_por_semana_templates/new_form.html.erb")
  end

  def create_row
    @horas_por_semana = HorasPorSemana.new

    @horas_por_semana.curso_id = params.fetch("curso_id")
    @horas_por_semana.asignatura_id = params.fetch("asignatura_id")
    @horas_por_semana.horasporsemana = params.fetch("horasporsemana")

    if @horas_por_semana.valid?
      @horas_por_semana.save

      redirect_to("/cursos/asig/#{@horas_por_semana.curso_id}", :notice => "Asignacion exitosa")
    else
      render("horas_por_semana_templates/new_form.html.erb")
    end
  end

  def edit_form
    @horas_por_semana = HorasPorSemana.find(params.fetch("prefill_with_id"))

    render("horas_por_semana_templates/edit_form.html.erb")
  end

  def update_row
    @horas_por_semana = HorasPorSemana.find(params.fetch("id_to_modify"))

    @horas_por_semana.curso_id = params.fetch("curso_id")
    @horas_por_semana.asignatura_id = params.fetch("asignatura_id")
    @horas_por_semana.horasporsemana = params.fetch("horasporsemana")

    if @horas_por_semana.valid?
      @horas_por_semana.save

     redirect_to("/cursos/asig/#{@horas_por_semana.curso_id}", :notice => "Asignacion exitosa")
    else
      render("horas_por_semana_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @horas_por_semana = HorasPorSemana.find(params.fetch("id_to_remove"))
    
    curso_id = @horas_por_semana.curso_id
    @horas_por_semana.destroy

    redirect_to("/cursos/asig/#{curso_id}", :notice => "Borrado exitoso")
  end
end
