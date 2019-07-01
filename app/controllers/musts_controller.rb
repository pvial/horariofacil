class MustsController < ApplicationController
  def index
    @musts = Must.all

    render("must_templates/index.html.erb")
  end

  def show
    @must = Must.find(params.fetch("id_to_display"))

    render("must_templates/show.html.erb")
  end

  def new_form
    render("must_templates/new_form.html.erb")
  end

  def create_row
    @must = Must.new

    @must.curso_id = params.fetch("curso_id")
    @must.profesor_id = params.fetch("profesor_id")
    @must.creador = params.fetch("creador")

    if @must.valid?
      @must.save

      redirect_back fallback_location: "/"
    else
      render("must_templates/new_form.html.erb")
    end
  end

  def edit_form
    @must = Must.find(params.fetch("prefill_with_id"))

    render("must_templates/edit_form.html.erb")
  end

  def update_row
    @must = Must.find(params.fetch("id_to_modify"))

    @must.curso_id = params.fetch("curso_id")
    @must.profesor_id = params.fetch("profesor_id")
    @must.creador = params.fetch("creador")

    if @must.valid?
      @must.save

      redirect_to("/musts/#{@must.id}", :notice => "Must updated successfully.")
    else
      render("must_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @must = Must.find(params.fetch("id_to_remove"))

    @must.destroy

    redirect_back fallback_location: "/"
  end
end
