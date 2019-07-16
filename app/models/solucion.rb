# == Schema Information
#
# Table name: solucions
#
#  id         :integer          not null, primary key
#  iteracion  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Solucion < ApplicationRecord
    has_many :sol_cursos, :dependent => :destroy
    has_many :sol_profes, :dependent => :destroy
    has_many :sol_matches, :dependent => :destroy
    
    
    # esta funcion genera la base para empezar a iterar. Fuerza todos los modulos que estan ingresados por el usuario, y valida que no haya conflictos
    def self.generar_base(cole)
        
        cursos_id = cole.cursos.pluck(:id)
        profes_id = cole.profesors.pluck(:id)
        
          s=Solucion.new
          s.iteracion = 0
          s.save
          
          # crea espacio para almacenar resultado de esta solucion
          for j in 1..60 do
            
            # crea 60 x n_cursos "modulos de solucion"
            for k in cursos_id do
              c = SolCurso.new
              c.solucion_id = s.id
              c.posicion=j
              c.curso_id = k
              c.save
            end
            
            # crea 60 x n_profes "modulos de solucion"
            for h in profes_id do
              c = SolProfe.new
              c.solucion_id = s.id
              c.posicion=j
              c.profe_id = h
              c.save
            end
          end  
          
          # asigna todos los forzados horario-asignatura  
          cole.tienes.each do |tiene|
            mod = tiene.modulo
            pos_mod = (mod.dia.columna - 1)*12 + mod.posicion
            cur = mod.curso
            asig = tiene.asignatura
            
            solcur = s.sol_cursos.where(:posicion => pos_mod).where(:curso_id => cur.id).last
            solcur.asignatura_id = asig.id
            solcur.save
          end
          
          # asigna todos los forzados profesor-curso  
          cole.curso_musts.each do |must|
            cur = must.curso
            prof = must.profesor
            asi = cur.asignaturas&prof.asignaturas
            
            # crea una asignacion de profesor a curso por cada asignatura que el profesor tiene en comun con el curso
            asi.each do |asig|
                n = SolMatch.new
                n.solucion_id = s.id
                n.profesor_id=prof.id
                n.curso_id = cur.id
                n.asignatura_id = asig.id
                n.save
            end
          end
          
          # Le asigno a los profesores que estan forzados en cursos la obligacion de hacer clases en los horarios que dichos cursos tienen las asignaturas que este profesor imparte
          s.sol_matches.each do |sm|
            asig_id = sm.asignatura_id
            prof_id = sm.profesor_id
            curso_id = sm.curso_id
            sol_id = s.id
            
            # le asigno la asignatura al profesor en el modulo que esta forzado a enseñarle a su curso
            s.sol_cursos.where(:asignatura_id => asig_id, :curso_id => curso_id).each do |sc|
                pos=sc.posicion
                sp = s.sol_profes.where(:posicion => pos, :profesor_id => prof_id).last
                if sp.asignatura_id == nil 
                    sp.asignatura_id = asig_id
                else #si hay inconsistencia, se detiene la funcion
                   dias= ["lunes","martes", "miércoles", "jueves", "viernes"]
                   flash[:notice]= "No se puede generar este sistema. Profesor #{Profesor.find(prof_id).nombre} no puede enseñar #{Asignatura.find(asig_id).nombre} al curso #{Curso.find(curso_id).nombre}. Ya está enseñando #{Asignatura.find(sp.asignatura_id).nombre} a otro curso el módulo #{pos%12} del día #{dia[pos/12-1]}"
                   break  
                end
            end
          
          end
          
        return(s)
    end

    
    # asignar le asigna xx horas a un curso y a su respectivo profesor
    def asignar(horas, prof_id, curso_id, asig_id ,sol)
       aux = horas
       
       #identifico los modulos vacios
       vacios_cur = sol.sol_cursos.where(:asignatura_id => nil, :curso_id => curso_id).pluck(:posicion)
       vacios_prof = sol.sol_profes.where(:asignatura_id => nil, :profe_id => prof_id).pluck(:posicion)
       
       # intersecto y busco modulos dobles
       candidatos=vacios_cur&vacios_prof
       pos = []
       
       for i in 1..(candidatos.count-1) do
        if candidatos[i]%2==1 && candidatos[i+1] == candidatos[i]+1  
            pos.push(candidatos[i])
        end
       end       
       
       
       while aux >=2 
        candidato = sol.sol_cursos.where(:asignatura_id => nil, :curso_id => curso_id).sample
        if candidato.posicion.even? || SolCurso.find(candidato.id+1).asignatura_id == nil 
        else
            
            if sol.sol_profes.where(:asignatura_id => nil, :profesor_id => prof_id)
                aux = aux-2
                candidato.asignatura_id = asig_id
                SolCurso.find(candidato.id+1).asignatura_id = asig_id
            else
        end
        
       end
        
    end
    
    def completar_horarios(cole)
        self.sol_matches.each do |sm|
            prof = Profesor.find(sm.profesor_id)
            curso = Curso.find(sm.curso_id)
            asig = Asignatura.find(sm.asignatura_id)
            
            if prof.horas_left(asig.id, self)>= curso.horas_porasignar(asig.id, self)
                
            else
                flash[:notice]= "No se puede generar este sistema. Profesor #{Profesor.find(prof_id).nombre} no puede enseñar #{Asignatura.find(asig_id).nombre} al curso #{Curso.find(curso_id).nombre}. No tiene suficientes horas disponibles para esta asignatura}"
                break 
            end
        end
        
    end



    
end
