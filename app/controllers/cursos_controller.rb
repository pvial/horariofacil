class CursosController < ApplicationController
  def land
    @cursos = Curso.all

    render("curso_templates/land.html.erb")
  end
  
  def index
    @cursos = Curso.all

    render("curso_templates/index.html.erb")
  end
  
  def land2
    @cursos = Curso.all

    render("curso_templates/land2.html.erb")
  end

  def show
    id = params.fetch("id_to_display")
    @curso = Curso.find(id)
    @modulos = Modulo.where(:curso_id => id)
    @asignaturas = @curso.asignaturas
    

    render("curso_templates/show_hor.html.erb")
  end
  
  def show_prof
    id = params.fetch("id_to_display")
    @curso = Curso.find(id)
    @modulos = Modulo.where(:curso_id => id)
    @asignaturas = @curso.asignaturas
    

    render("curso_templates/show_prof.html.erb")
  end
  
  def show_asig
    id = params.fetch("id_to_display")
    @curso = Curso.find(id)
    @modulos = Modulo.where(:curso_id => id)
    @asignaturas = @curso.asignaturas
    

    render("curso_templates/show_asig.html.erb")
  end
  
  def show_hor
    id = params.fetch("id_to_display")
    @curso = Curso.find(id)
    @modulos = @curso.modulos
    @asignaturas = @curso.asignaturas
    

    render("curso_templates/show_hor.html.erb")
  end

  def new_form
    render("curso_templates/new_form.html.erb")
  end

  def create_row
    @curso = Curso.new

    @curso.colegio_id = params.fetch("colegio_id")
    @curso.profesorjefe_id = params.fetch("profesorjefe_id")
    @curso.nombre = params.fetch("nombre")
    @curso.nivel_id = params.fetch("nivel_id")
    
    if @curso.valid?
      @curso.save
      
      Day.all.each do |dia|
        for i in 1..12 do 
          mod = Modulo.new
          mod.curso_id=@curso.id
          mod.dia_id=dia.id
          mod.activo = true #evaluar como hacer esto relacionado a las horas reales
          mod.posicion=i
          
          mod.save
        end
      end
      
      redirect_to("/cursos", :notice => "Curso creado correctamente.")
    else
      render("curso_templates/new_form.html.erb")
    end
  end

  def edit_form
    @curso = Curso.find(params.fetch("prefill_with_id"))

    render("curso_templates/edit_form.html.erb")
  end

  def update_row
    @curso = Curso.find(params.fetch("id_to_modify"))

    @curso.colegio_id = params.fetch("colegio_id")
    @curso.profesorjefe_id = params.fetch("profesorjefe_id")
    @curso.nombre = params.fetch("nombre")

    if @curso.valid?
      @curso.save

      redirect_to("/cursos/#{@curso.id}", :notice => "Curso updated successfully.")
    else
      render("curso_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @curso = Curso.find(params.fetch("id_to_remove"))

    @curso.destroy

    redirect_to("/cursos", :notice => "Curso deleted successfully.")
  end
end
