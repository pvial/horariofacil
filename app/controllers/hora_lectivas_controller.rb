class HoraLectivasController < ApplicationController
  def index
    @hora_lectivas = HoraLectiva.all

    render("hora_lectiva_templates/index.html.erb")
  end

  def show
    @hora_lectiva = HoraLectiva.find(params.fetch("id_to_display"))

    render("hora_lectiva_templates/show.html.erb")
  end

  def new_form
    render("hora_lectiva_templates/new_form.html.erb")
  end

  def create_row
    @hora_lectiva = HoraLectiva.new

    @hora_lectiva.dia_id = params.fetch("dia_id")
    @hora_lectiva.posicion = params.fetch("posicion")
    @hora_lectiva.activo = params.fetch("activo")
    @hora_lectiva.profesor_id = params.fetch("profesor_id")

    if @hora_lectiva.valid?
      @hora_lectiva.save

      redirect_to("/hora_lectivas", :notice => "Hora lectiva created successfully.")
    else
      render("hora_lectiva_templates/new_form.html.erb")
    end
  end

  def edit_form
    @hora_lectiva = HoraLectiva.find(params.fetch("prefill_with_id"))

    render("hora_lectiva_templates/edit_form.html.erb")
  end

  def update_row
    @hora_lectiva = HoraLectiva.find(params.fetch("id_to_modify"))

    @hora_lectiva.dia_id = params.fetch("dia_id")
    @hora_lectiva.posicion = params.fetch("posicion")
    @hora_lectiva.activo = params.fetch("activo")
    @hora_lectiva.profesor_id = params.fetch("profesor_id")

    if @hora_lectiva.valid?
      @hora_lectiva.save

      redirect_to("/hora_lectivas/#{@hora_lectiva.id}", :notice => "Hora lectiva updated successfully.")
    else
      render("hora_lectiva_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @hora_lectiva = HoraLectiva.find(params.fetch("id_to_remove"))

    @hora_lectiva.destroy

    redirect_to("/hora_lectivas", :notice => "Hora lectiva deleted successfully.")
  end
end
