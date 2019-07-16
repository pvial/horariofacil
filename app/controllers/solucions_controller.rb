class SolucionsController < ApplicationController
  
  # comineza una iteracion de n veces para encontrar soluciones plausibles
  def correr
    
    # genera solucion base con
    ## sabanas de curso y profesor. (60xn_profes y 60xn_cursos) 
    ## Fuerza los "tiene" y los "must" en la solucion
    # retorna solucion base
    @soluciones = Solucion.generar_base(current_planificador.colegio)
    
    
    
    render("solucion_templates/mostrar.html.erb")
  end
  
  
  def index
    @solucions = Solucion.all

    render("solucion_templates/index.html.erb")
  end

  def show
    @solucion = Solucion.find(params.fetch("id_to_display"))

    render("solucion_templates/show.html.erb")
  end

  def new_form
    render("solucion_templates/new_form.html.erb")
  end

  def create_row
    @solucion = Solucion.new

    @solucion.iteracion = params.fetch("iteracion")

    if @solucion.valid?
      @solucion.save

      redirect_to("/solucions", :notice => "Solucion created successfully.")
    else
      render("solucion_templates/new_form.html.erb")
    end
  end

  def edit_form
    @solucion = Solucion.find(params.fetch("prefill_with_id"))

    render("solucion_templates/edit_form.html.erb")
  end

  def update_row
    @solucion = Solucion.find(params.fetch("id_to_modify"))

    @solucion.iteracion = params.fetch("iteracion")

    if @solucion.valid?
      @solucion.save

      redirect_to("/solucions/#{@solucion.id}", :notice => "Solucion updated successfully.")
    else
      render("solucion_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @solucion = Solucion.find(params.fetch("id_to_remove"))

    @solucion.destroy

    redirect_to("/solucions", :notice => "Solucion deleted successfully.")
  end
end
