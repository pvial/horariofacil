class SolCursosController < ApplicationController
  def index
    @sol_cursos = SolCurso.all

    render("sol_curso_templates/index.html.erb")
  end

  def show
    @sol_curso = SolCurso.find(params.fetch("id_to_display"))

    render("sol_curso_templates/show.html.erb")
  end

  def new_form
    render("sol_curso_templates/new_form.html.erb")
  end

  def create_row
    @sol_curso = SolCurso.new

    @sol_curso.solucion_id = params.fetch("solucion_id")
    @sol_curso.posicion = params.fetch("posicion")
    @sol_curso.asignatura_id = params.fetch("asignatura_id")

    if @sol_curso.valid?
      @sol_curso.save

      redirect_to("/sol_cursos", :notice => "Sol curso created successfully.")
    else
      render("sol_curso_templates/new_form.html.erb")
    end
  end

  def edit_form
    @sol_curso = SolCurso.find(params.fetch("prefill_with_id"))

    render("sol_curso_templates/edit_form.html.erb")
  end

  def update_row
    @sol_curso = SolCurso.find(params.fetch("id_to_modify"))

    @sol_curso.solucion_id = params.fetch("solucion_id")
    @sol_curso.posicion = params.fetch("posicion")
    @sol_curso.asignatura_id = params.fetch("asignatura_id")

    if @sol_curso.valid?
      @sol_curso.save

      redirect_to("/sol_cursos/#{@sol_curso.id}", :notice => "Sol curso updated successfully.")
    else
      render("sol_curso_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @sol_curso = SolCurso.find(params.fetch("id_to_remove"))

    @sol_curso.destroy

    redirect_to("/sol_cursos", :notice => "Sol curso deleted successfully.")
  end
end
