class CantsController < ApplicationController
  def index
    @cants = Cant.all

    render("cant_templates/index.html.erb")
  end

  def show
    @cant = Cant.find(params.fetch("id_to_display"))

    render("cant_templates/show.html.erb")
  end

  def new_form
    render("cant_templates/new_form.html.erb")
  end

  def create_row
    @cant = Cant.new

    @cant.curso_id = params.fetch("curso_id")
    @cant.profesor_id = params.fetch("profesor_id")
    @cant.creador = params.fetch("creador")

    if @cant.valid?
      @cant.save

      redirect_back fallback_location: "/"
    else
      render("cant_templates/new_form.html.erb")
    end
  end

  def edit_form
    @cant = Cant.find(params.fetch("prefill_with_id"))

    render("cant_templates/edit_form.html.erb")
  end

  def update_row
    @cant = Cant.find(params.fetch("id_to_modify"))

    @cant.curso_id = params.fetch("curso_id")
    @cant.profesor_id = params.fetch("profesor_id")
    @cant.creador = params.fetch("creador")

    if @cant.valid?
      @cant.save

      redirect_to("/cants/#{@cant.id}", :notice => "Cant updated successfully.")
    else
      render("cant_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @cant = Cant.find(params.fetch("id_to_remove"))

    @cant.destroy

    redirect_back fallback_location: "/"
  end
end
