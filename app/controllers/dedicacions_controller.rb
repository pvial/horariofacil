class DedicacionsController < ApplicationController
  def index
    @dedicacions = Dedicacion.all

    render("dedicacion_templates/index.html.erb")
  end

  def show
    @dedicacion = Dedicacion.find(params.fetch("id_to_display"))

    render("dedicacion_templates/show.html.erb")
  end

  def new_form
    render("dedicacion_templates/new_form.html.erb")
  end

  def create_row
    @dedicacion = Dedicacion.new

    @dedicacion.profesor_id = params.fetch("profesor_id")
    @dedicacion.asignatura_id = params.fetch("asignatura_id")
    @dedicacion.dedicacion = params.fetch("dedicacion")

    if @dedicacion.valid?
      @dedicacion.save

      redirect_to("/dedicacions", :notice => "Dedicacion created successfully.")
    else
      render("dedicacion_templates/new_form.html.erb")
    end
  end

  def edit_form
    @dedicacion = Dedicacion.find(params.fetch("prefill_with_id"))

    render("dedicacion_templates/edit_form.html.erb")
  end

  def update_row
    @dedicacion = Dedicacion.find(params.fetch("id_to_modify"))

    @dedicacion.profesor_id = params.fetch("profesor_id")
    @dedicacion.asignatura_id = params.fetch("asignatura_id")
    @dedicacion.dedicacion = params.fetch("dedicacion")

    if @dedicacion.valid?
      @dedicacion.save

      redirect_to("/dedicacions/#{@dedicacion.id}", :notice => "Dedicacion updated successfully.")
    else
      render("dedicacion_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @dedicacion = Dedicacion.find(params.fetch("id_to_remove"))

    @dedicacion.destroy

    redirect_to("/dedicacions", :notice => "Dedicacion deleted successfully.")
  end
end
