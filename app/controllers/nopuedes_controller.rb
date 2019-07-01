class NopuedesController < ApplicationController
  def index
    @nopuedes = Nopuede.all

    render("nopuede_templates/index.html.erb")
  end

  def show
    @nopuede = Nopuede.find(params.fetch("id_to_display"))

    render("nopuede_templates/show.html.erb")
  end

  def new_form
    render("nopuede_templates/new_form.html.erb")
  end

  def create_row
    @nopuede = Nopuede.new

    curso = params.fetch("curso_id")
    pos = params.fetch("posicion")
    dia = params.fetch("dia_id")
    modulo = Curso.find(curso).modulos.where(:dia_id => dia).where(:posicion => pos).last.id
    
    @nopuede.modulo_id = modulo
    @nopuede.asignatura_id = params.fetch("asignatura_id")

    if @nopuede.valid?
      @nopuede.save

      redirect_back fallback_location: "/"
    else
      render("nopuede_templates/new_form.html.erb")
    end
  end

  def edit_form
    @nopuede = Nopuede.find(params.fetch("prefill_with_id"))

    render("nopuede_templates/edit_form.html.erb")
  end

  def update_row
    @nopuede = Nopuede.find(params.fetch("id_to_modify"))

    @nopuede.modulo_id = params.fetch("modulo_id")
    @nopuede.asignatura_id = params.fetch("asignatura_id")

    if @nopuede.valid?
      @nopuede.save

      redirect_to("/nopuedes/#{@nopuede.id}", :notice => "Nopuede updated successfully.")
    else
      render("nopuede_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @nopuede = Nopuede.find(params.fetch("id_to_remove"))

    @nopuede.destroy

    redirect_to("/nopuedes", :notice => "Nopuede deleted successfully.")
  end
end
