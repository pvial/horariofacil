class JefesDepartamentosController < ApplicationController
  def index
    @coordinadors = Coordinador.where(:colegio_id => current_planificador.colegio_id)

    render("jefes_departamento_templates/index.html.erb")
  end

  def show
    @coordinador = Coordinador.find(params.fetch("id_to_display"))

    render("jefes_departamento_templates/show.html.erb")
  end

  def new_form
    render("jefes_departamento_templates/new_form.html.erb")
  end

  def edit_form
    @coordinador = Coordinador.find(params.fetch("prefill_with_id"))

    render("jefes_departamento_templates/edit_form.html.erb")
  end
   
  def create_row
    colegio_id = params.fetch("colegio_id")
    departamento_id = params.fetch("departamento_id")
    nombre = params.fetch("nombre")
    email = params.fetch("email")
    password = params.fetch("password")
    
    @coord = Coordinador.new(:email => email, :password => password, :password_confirmation => password, :departamento_id => departamento_id, :colegio_id => colegio_id, :nombre=>nombre)
    
    if @coord.valid?
      @coord.save

      redirect_to("/jefe_deptos", :notice => "Coordinador creado correctamente.")
    else
      render("jefes_departamento_templates/new_form.html.erb")
    end
  end
end
