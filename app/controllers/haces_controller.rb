class HacesController < ApplicationController
  def index
    @haces = Hace.all

    render("hace_templates/index.html.erb")
  end

  def show
    @hace = Hace.find(params.fetch("id_to_display"))

    render("hace_templates/show.html.erb")
  end

  def new_form
    render("hace_templates/new_form.html.erb")
  end

  def create_row
    @hace = Hace.new

    @hace.profesor_id = params.fetch("profesor_id")
    @hace.nivel_id = params.fetch("nivel_id")
    @hace.hace = params.fetch("hace")

    if @hace.valid?
      @hace.save

      redirect_to("/haces", :notice => "Hace created successfully.")
    else
      render("hace_templates/new_form.html.erb")
    end
  end

  def edit_form
    @hace = Hace.find(params.fetch("prefill_with_id"))

    render("hace_templates/edit_form.html.erb")
  end

  def update_row
    @hace = Hace.find(params.fetch("id_to_modify"))

    @hace.profesor_id = params.fetch("profesor_id")
    @hace.nivel_id = params.fetch("nivel_id")
    @hace.hace = params.fetch("hace")

    if @hace.valid?
      @hace.save

      redirect_to("/haces/#{@hace.id}", :notice => "Hace updated successfully.")
    else
      render("hace_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @hace = Hace.find(params.fetch("id_to_remove"))

    @hace.destroy

    redirect_to("/haces", :notice => "Hace deleted successfully.")
  end
end
