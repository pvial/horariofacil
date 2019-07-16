class SolMatchesController < ApplicationController
  def index
    @sol_matches = SolMatch.all

    render("sol_match_templates/index.html.erb")
  end

  def show
    @sol_match = SolMatch.find(params.fetch("id_to_display"))

    render("sol_match_templates/show.html.erb")
  end

  def new_form
    render("sol_match_templates/new_form.html.erb")
  end

  def create_row
    @sol_match = SolMatch.new

    @sol_match.asignatura_id = params.fetch("asignatura_id")
    @sol_match.curso_id = params.fetch("curso_id")
    @sol_match.profesor_id = params.fetch("profesor_id")
    @sol_match.solucion_id = params.fetch("solucion_id")

    if @sol_match.valid?
      @sol_match.save

      redirect_to("/sol_matches", :notice => "Sol match created successfully.")
    else
      render("sol_match_templates/new_form.html.erb")
    end
  end

  def edit_form
    @sol_match = SolMatch.find(params.fetch("prefill_with_id"))

    render("sol_match_templates/edit_form.html.erb")
  end

  def update_row
    @sol_match = SolMatch.find(params.fetch("id_to_modify"))

    @sol_match.asignatura_id = params.fetch("asignatura_id")
    @sol_match.curso_id = params.fetch("curso_id")
    @sol_match.profesor_id = params.fetch("profesor_id")
    @sol_match.solucion_id = params.fetch("solucion_id")

    if @sol_match.valid?
      @sol_match.save

      redirect_to("/sol_matches/#{@sol_match.id}", :notice => "Sol match updated successfully.")
    else
      render("sol_match_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @sol_match = SolMatch.find(params.fetch("id_to_remove"))

    @sol_match.destroy

    redirect_to("/sol_matches", :notice => "Sol match deleted successfully.")
  end
end
