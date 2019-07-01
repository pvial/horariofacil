class ProfesorsController < ApplicationController
  def index
    @profesors = Profesor.where(:colegio_id => current_planificador.colegio_id)

    render("profesor_templates/index.html.erb")
  end

  def show
    @profesor = Profesor.find(params.fetch("id_to_display"))
    @horaslectivas = HoraLectiva.where(:profesor_id => @profesor.id)

    render("profesor_templates/show.html.erb")
  end

  def new_form
    render("profesor_templates/new_form.html.erb")
  end

  def create_row
    @profesor = Profesor.new

    @profesor.departamento_id = params.fetch("departamento_id")
    @profesor.nombre = params.fetch("nombre")

    if @profesor.valid?
      @profesor.save
      
      Day.all.each do |dia|
        for i in 1..12 do 
          mod = HoraLectiva.new
          mod.profesor_id=@profesor.id
          mod.dia_id=dia.id
          mod.activo = true #evaluar como hacer esto relacionado a las horas reales
          mod.posicion=i
          
          mod.save
        end
      end
      
      redirect_to("/profesors", :notice => "Profesor created successfully.")
    else
      render("profesor_templates/new_form.html.erb")
    end
  end

  def edit_form
    @profesor = Profesor.find(params.fetch("prefill_with_id"))

    render("profesor_templates/edit_form.html.erb")
  end

  def update_row
    @profesor = Profesor.find(params.fetch("id_to_modify"))

    @profesor.departamento_id = params.fetch("departamento_id")
    @profesor.nombre = params.fetch("nombre")

    if @profesor.valid?
      @profesor.save

      redirect_to("/profesors/#{@profesor.id}", :notice => "Profesor updated successfully.")
    else
      render("profesor_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @profesor = Profesor.find(params.fetch("id_to_remove"))

    @profesor.destroy

    redirect_to("/profesors", :notice => "Profesor deleted successfully.")
  end
end
