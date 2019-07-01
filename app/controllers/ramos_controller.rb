class RamosController < ApplicationController
  def index
    @ramos = Ramo.all

    render("ramo_templates/index.html.erb")
  end

  def show
    @ramo = Ramo.find(params.fetch("id_to_display"))

    render("ramo_templates/show.html.erb")
  end

  def new_form
    render("ramo_templates/new_form.html.erb")
  end

  def create_row
    @ramo = Ramo.new

    @ramo.nombre = params.fetch("nombre")

    if @ramo.valid?
      @ramo.save

      redirect_to("/ramos", :notice => "Ramo created successfully.")
    else
      render("ramo_templates/new_form.html.erb")
    end
  end

  def edit_form
    @ramo = Ramo.find(params.fetch("prefill_with_id"))

    render("ramo_templates/edit_form.html.erb")
  end

  def update_row
    @ramo = Ramo.find(params.fetch("id_to_modify"))

    @ramo.nombre = params.fetch("nombre")

    if @ramo.valid?
      @ramo.save

      redirect_to("/ramos/#{@ramo.id}", :notice => "Ramo updated successfully.")
    else
      render("ramo_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @ramo = Ramo.find(params.fetch("id_to_remove"))

    @ramo.destroy

    redirect_to("/ramos", :notice => "Ramo deleted successfully.")
  end
end
