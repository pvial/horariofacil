Rails.application.routes.draw do
  # Routes for the Coordinador resource:

  # CREATE
  get("/jefe_depto/new", { :controller => "jefes_departamentos", :action => "new_form" })
  post("/create_coordinador", { :controller => "jefes_departamentos", :action => "create_row" })
  # READ
  get("/jefe_deptos", { :controller => "jefes_departamentos", :action => "index" })
  get("/jefe_deptos/:id_to_display", { :controller => "jefes_departamentos", :action => "show" })

  # UPDATE
  get("/jefe_deptos/:prefill_with_id/edit", { :controller => "jefes_departamentos", :action => "edit_form" })
  
  #------------------------------


  # Routes for the Salas resource:

  # CREATE
  get("/salas/new", { :controller => "salas", :action => "new_form" })
  post("/create_sala", { :controller => "salas", :action => "create_row" })

  # READ
  get("/salas", { :controller => "salas", :action => "index" })
  get("/salas/:id_to_display", { :controller => "salas", :action => "show" })

  # UPDATE
  get("/salas/:prefill_with_id/edit", { :controller => "salas", :action => "edit_form" })
  post("/update_sala/:id_to_modify", { :controller => "salas", :action => "update_row" })

  # DELETE
  get("/sala/:id_to_remove", { :controller => "salas", :action => "destroy_row" })

  #------------------------------


  # Routes for the Horas por semana resource:

  # CREATE
  get("/horas_por_semanas/new/:curso_id", { :controller => "horas_por_semanas", :action => "new_form" })
  post("/create_horas_por_semana", { :controller => "horas_por_semanas", :action => "create_row" })

  # READ
  get("/horas_por_semanas", { :controller => "horas_por_semanas", :action => "index" })
  get("/horas_por_semanas/:id_to_display", { :controller => "horas_por_semanas", :action => "show" })

  # UPDATE
  get("/horas_por_semanas/:prefill_with_id/edit", { :controller => "horas_por_semanas", :action => "edit_form" })
  post("/update_horas_por_semana/:id_to_modify", { :controller => "horas_por_semanas", :action => "update_row" })

  # DELETE
  get("/delete_horas_por_semana/:id_to_remove", { :controller => "horas_por_semanas", :action => "destroy_row" })

  #------------------------------

  # Routes for the Requerimiento resource:

  # CREATE
  get("/requerimientos/new", { :controller => "requerimientos", :action => "new_form" })
  post("/create_requerimiento", { :controller => "requerimientos", :action => "create_row" })

  # READ
  get("/requerimientos", { :controller => "requerimientos", :action => "index" })
  get("/requerimientos/:id_to_display", { :controller => "requerimientos", :action => "show" })

  # UPDATE
  get("/requerimientos/:prefill_with_id/edit", { :controller => "requerimientos", :action => "edit_form" })
  post("/update_requerimiento/:id_to_modify", { :controller => "requerimientos", :action => "update_row" })

  # DELETE
  get("/delete_requerimiento/:id_to_remove", { :controller => "requerimientos", :action => "destroy_row" })

  #------------------------------

  # Routes for the Nivel resource:

  # CREATE
  get("/nivels/new", { :controller => "nivels", :action => "new_form" })
  post("/create_nivel", { :controller => "nivels", :action => "create_row" })

  # READ
  get("/nivels", { :controller => "nivels", :action => "index" })
  get("/nivels/:id_to_display", { :controller => "nivels", :action => "show" })

  # UPDATE
  get("/nivels/:prefill_with_id/edit", { :controller => "nivels", :action => "edit_form" })
  post("/update_nivel/:id_to_modify", { :controller => "nivels", :action => "update_row" })

  # DELETE
  get("/delete_nivel/:id_to_remove", { :controller => "nivels", :action => "destroy_row" })

  #------------------------------

  # Routes for the Dedicacion resource:

  # CREATE
  get("/dedicacions/new", { :controller => "dedicacions", :action => "new_form" })
  post("/create_dedicacion", { :controller => "dedicacions", :action => "create_row" })

  # READ
  get("/dedicacions", { :controller => "dedicacions", :action => "index" })
  get("/dedicacions/:id_to_display", { :controller => "dedicacions", :action => "show" })

  # UPDATE
  get("/dedicacions/:prefill_with_id/edit", { :controller => "dedicacions", :action => "edit_form" })
  post("/update_dedicacion/:id_to_modify", { :controller => "dedicacions", :action => "update_row" })

  # DELETE
  get("/delete_dedicacion/:id_to_remove", { :controller => "dedicacions", :action => "destroy_row" })

  #------------------------------

  # Routes for the Hora lectiva resource:

  # CREATE
  get("/hora_lectivas/new", { :controller => "hora_lectivas", :action => "new_form" })
  post("/create_hora_lectiva", { :controller => "hora_lectivas", :action => "create_row" })

  # READ
  get("/hora_lectivas", { :controller => "hora_lectivas", :action => "index" })
  get("/hora_lectivas/:id_to_display", { :controller => "hora_lectivas", :action => "show" })

  # UPDATE
  get("/hora_lectivas/:prefill_with_id/edit", { :controller => "hora_lectivas", :action => "edit_form" })
  post("/update_hora_lectiva/:id_to_modify", { :controller => "hora_lectivas", :action => "update_row" })

  # DELETE
  get("/delete_hora_lectiva/:id_to_remove", { :controller => "hora_lectivas", :action => "destroy_row" })

  #------------------------------

  # Routes for the Nopuede resource:

  # CREATE
  get("/nopuedes/new", { :controller => "nopuedes", :action => "new_form" })
  post("/create_nopuede", { :controller => "nopuedes", :action => "create_row" })

  # READ
  get("/nopuedes", { :controller => "nopuedes", :action => "index" })
  get("/nopuedes/:id_to_display", { :controller => "nopuedes", :action => "show" })

  # UPDATE
  get("/nopuedes/:prefill_with_id/edit", { :controller => "nopuedes", :action => "edit_form" })
  post("/update_nopuede/:id_to_modify", { :controller => "nopuedes", :action => "update_row" })

  # DELETE
  get("/delete_nopuede/:id_to_remove", { :controller => "nopuedes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Tiene resource:

  # CREATE
  get("/tienes/new", { :controller => "tienes", :action => "new_form" })
  post("/create_tiene", { :controller => "tienes", :action => "create_row" })

  # READ
  get("/tienes", { :controller => "tienes", :action => "index" })
  get("/tienes/:id_to_display", { :controller => "tienes", :action => "show" })

  # UPDATE
  get("/tienes/:prefill_with_id/edit", { :controller => "tienes", :action => "edit_form" })
  post("/update_tiene/:id_to_modify", { :controller => "tienes", :action => "update_row" })

  # DELETE
  get("/delete_tiene/:id_to_remove", { :controller => "tienes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Day resource:

  # CREATE
  get("/days/new", { :controller => "days", :action => "new_form" })
  post("/create_day", { :controller => "days", :action => "create_row" })

  # READ
  get("/days", { :controller => "days", :action => "index" })
  get("/days/:id_to_display", { :controller => "days", :action => "show" })

  # UPDATE
  get("/days/:prefill_with_id/edit", { :controller => "days", :action => "edit_form" })
  post("/update_day/:id_to_modify", { :controller => "days", :action => "update_row" })

  # DELETE
  get("/delete_day/:id_to_remove", { :controller => "days", :action => "destroy_row" })

  #------------------------------

  # Routes for the Modulo resource:

  # CREATE
  get("/modulos/new", { :controller => "modulos", :action => "new_form" })
  post("/create_modulo", { :controller => "modulos", :action => "create_row" })

  # READ
  get("/modulos", { :controller => "modulos", :action => "index" })
  get("/modulos/:id_to_display", { :controller => "modulos", :action => "show" })

  # UPDATE
  get("/modulos/:prefill_with_id/edit", { :controller => "modulos", :action => "edit_form" })
  post("/update_modulo/:id_to_modify", { :controller => "modulos", :action => "update_row" })

  # DELETE
  get("/delete_modulo/:id_to_remove", { :controller => "modulos", :action => "destroy_row" })

  #------------------------------

  # Routes for the Cant resource:

  # CREATE
  get("/cants/new", { :controller => "cants", :action => "new_form" })
  post("/create_cant", { :controller => "cants", :action => "create_row" })

  # READ
  get("/cants", { :controller => "cants", :action => "index" })
  get("/cants/:id_to_display", { :controller => "cants", :action => "show" })

  # UPDATE
  get("/cants/:prefill_with_id/edit", { :controller => "cants", :action => "edit_form" })
  post("/update_cant/:id_to_modify", { :controller => "cants", :action => "update_row" })

  # DELETE
  get("/delete_cant/:id_to_remove", { :controller => "cants", :action => "destroy_row" })

  #------------------------------

  # Routes for the Must resource:

  # CREATE
  get("/musts/new", { :controller => "musts", :action => "new_form" })
  post("/create_must", { :controller => "musts", :action => "create_row" })

  # READ
  get("/musts", { :controller => "musts", :action => "index" })
  get("/musts/:id_to_display", { :controller => "musts", :action => "show" })

  # UPDATE
  get("/musts/:prefill_with_id/edit", { :controller => "musts", :action => "edit_form" })
  post("/update_must/:id_to_modify", { :controller => "musts", :action => "update_row" })

  # DELETE
  get("/delete_must/:id_to_remove", { :controller => "musts", :action => "destroy_row" })

  #------------------------------

  # Routes for the Ramo resource:

  # CREATE
  get("/ramos/new", { :controller => "ramos", :action => "new_form" })
  post("/create_ramo", { :controller => "ramos", :action => "create_row" })

  # READ
  get("/ramos", { :controller => "ramos", :action => "index" })
  get("/ramos/:id_to_display", { :controller => "ramos", :action => "show" })

  # UPDATE
  get("/ramos/:prefill_with_id/edit", { :controller => "ramos", :action => "edit_form" })
  post("/update_ramo/:id_to_modify", { :controller => "ramos", :action => "update_row" })

  # DELETE
  get("/delete_ramo/:id_to_remove", { :controller => "ramos", :action => "destroy_row" })

  #------------------------------

  # Routes for the Asignatura resource:

  # CREATE
  get("/asignaturas/new", { :controller => "asignaturas", :action => "new_form" })
  post("/create_asignatura", { :controller => "asignaturas", :action => "create_row" })

  # READ
  get("/asignaturas", { :controller => "asignaturas", :action => "index" })
  get("/asignaturas_show/:curso_id", { :controller => "asignaturas", :action => "index_show" })
  get("/asignaturas_indice", { :controller => "asignaturas", :action => "indice" })
  get("/asignaturas/:id_to_display", { :controller => "asignaturas", :action => "show" })

  # UPDATE
  get("/asignaturas/:prefill_with_id/edit", { :controller => "asignaturas", :action => "edit_form" })
  post("/update_asignatura/:id_to_modify", { :controller => "asignaturas", :action => "update_row" })

  # DELETE
  get("/delete_asignatura/:id_to_remove", { :controller => "asignaturas", :action => "destroy_row" })

  #------------------------------

  # Routes for the Curso resource:

  # CREATE
  get("/cursos/new", { :controller => "cursos", :action => "new_form" })
  post("/create_curso", { :controller => "cursos", :action => "create_row" })

  # READ
  get("/cursos", { :controller => "cursos", :action => "index" })
  get("/cursos/:id_to_display", { :controller => "cursos", :action => "show" })
  get("/cursos/prof/:id_to_display", { :controller => "cursos", :action => "show_prof" })
  get("/cursos/asig/:id_to_display", { :controller => "cursos", :action => "show_asig" })
  get("/cursos/hor/:id_to_display", { :controller => "cursos", :action => "show_hor" })

  # UPDATE
  get("/cursos/:prefill_with_id/edit", { :controller => "cursos", :action => "edit_form" })
  post("/update_curso/:id_to_modify", { :controller => "cursos", :action => "update_row" })

  # DELETE
  get("/delete_curso/:id_to_remove", { :controller => "cursos", :action => "destroy_row" })

  #------------------------------

  # Routes for the Profesor resource:

  # CREATE
  get("/profesors/new", { :controller => "profesors", :action => "new_form" })
  post("/create_profesor", { :controller => "profesors", :action => "create_row" })

  # READ
  get("/profesors", { :controller => "profesors", :action => "index" })
  get("/profesors/:id_to_display", { :controller => "profesors", :action => "show" })
  get("/profesors/hor/:id_to_display", { :controller => "profesors", :action => "show_hor" })
  get("/profesors/curs/:id_to_display", { :controller => "profesors", :action => "show_curs" })
  get("/profesors/asig/:id_to_display", { :controller => "profesors", :action => "show_asig" })

  # UPDATE
  get("/profesors/:prefill_with_id/edit", { :controller => "profesors", :action => "edit_form" })
  post("/update_profesor/:id_to_modify", { :controller => "profesors", :action => "update_row" })

  # DELETE
  get("/delete_profesor/:id_to_remove", { :controller => "profesors", :action => "destroy_row" })

  #------------------------------

  # Routes for the Departamento resource:

  # CREATE
  get("/departamentos/new", { :controller => "departamentos", :action => "new_form" })
  post("/create_departamento", { :controller => "departamentos", :action => "create_row" })

  # READ
  get("/departamentos", { :controller => "departamentos", :action => "index" })
  get("/departamentos/:id_to_display", { :controller => "departamentos", :action => "show" })

  # UPDATE
  get("/departamentos/:prefill_with_id/edit", { :controller => "departamentos", :action => "edit_form" })
  post("/update_departamento/:id_to_modify", { :controller => "departamentos", :action => "update_row" })

  # DELETE
  get("/delete_departamento/:id_to_remove", { :controller => "departamentos", :action => "destroy_row" })

  #------------------------------

  devise_for :coordinadors
  # Routes for the Colegio resource:

  # CREATE
  get("/colegios/new", { :controller => "colegios", :action => "new_form" })
  post("/create_colegio", { :controller => "colegios", :action => "create_row" })

  # READ
  get("/colegios", { :controller => "colegios", :action => "index" })
  get("/colegios/:id_to_display", { :controller => "colegios", :action => "show" })

  # UPDATE
  get("/colegios/:prefill_with_id/edit", { :controller => "colegios", :action => "edit_form" })
  post("/update_colegio/:id_to_modify", { :controller => "colegios", :action => "update_row" })

  # DELETE
  get("/delete_colegio/:id_to_remove", { :controller => "colegios", :action => "destroy_row" })

  #------------------------------

  devise_for :planificadors
  # Routes for the Coffee Bean resource:

  # CREATE
  get("/coffee_beans/new", { :controller => "coffee_beans", :action => "new_form" })
  get("/create_coffee_bean", { :controller => "coffee_beans", :action => "create_row" })

  # READ
  get("/coffee_beans", { :controller => "coffee_beans", :action => "index" })
  get("/coffee_beans/:id", { :controller => "coffee_beans", :action => "show" })

  # UPDATE
  get("/coffee_beans/:id/edit", { :controller => "coffee_beans", :action => "edit_form" })
  get("/update_coffee_bean/:id", { :controller => "coffee_beans", :action => "update_row" })

  # DELETE
  get("/delete_coffee_bean/:id", { :controller => "coffee_beans", :action => "destroy_row" })

  #------------------------------

  # Routes for the Food resource:

  # CREATE
  get("/foods/new", { :controller => "foods", :action => "new_form" })
  get("/create_food", { :controller => "foods", :action => "create_row" })

  # READ
  get("/foods", { :controller => "foods", :action => "index" })
  get("/foods/:id", { :controller => "foods", :action => "show" })

  # UPDATE
  get("/foods/:id/edit", { :controller => "foods", :action => "edit_form" })
  get("/update_food/:id", { :controller => "foods", :action => "update_row" })

  # DELETE
  get("/delete_food/:id", { :controller => "foods", :action => "destroy_row" })

  #------------------------------

  get("/", { :controller => "cursos", :action => "land" })

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
