<%-- 
    Document   : index
    Created on : 20/09/2023, 10:56:10 a. m.
    Author     : Grupo 7
--%>

<%@page import="com.umariana.mundo.exposicionPerro"%>
<%@page import="java.io.IOException"%>
<%@include file="temps/header.jsp" %>
     
   <!-- Imagen de encabezado con la clase "PerroBandera" -->
<%
            //Array que recorre al perro llamado con la funcion editar
            ArrayList <perro> misPerros = null;
            //String Tipo= request.getParameter("Tipo");
            String nombreEd= request.getParameter("nombreEdit");
            //llamamos al servlet
            ServletContext context=  getServletContext();
            //inicializa perro como nulo
            perro p= null;
            //lo deserialza, y como parametro se llama a context
            misPerros= exposicionPerro.deserializar( context);
 
            //for para recorrer el perro, 
        for( perro i : misPerros){
        //if para llamar al nombre y que se reemplace por nombreEd
            if (i.getNombre().equals(nombreEd)){
            //Variable p que se inicializa con i - se reemplaza
                p=i; 
                break;
            }
        }
       
      
        %>     
        <!-- Perro bandera-->
   <image  class= "PerroBandera" src="./img/perro.jpg" width="100%" >
    <div class="row">
    <div class="col">
     <div class="card">
        <div class="card-body" >

   <!-- Formulario para ingresar informacion sobre un perro -->

            <form action="SvPerro" method="POST" enctype="multipart/form-data">

   <!-- Ti­tulo del formulario -->
                <div class="container text-center">
                 <legend>Editar Perro</legend>
                  </div>
    <!-- Campo para ingresar el nombre del perro -->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1" >Nombre</span>
                        <input type="text" class="form-control" name="nombre" value="<%out.print(p.getNombre());%>" readonly>
                   </div>
     <!-- Campo para ingresar la raza del perro -->
                     <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Raza</span>
                        <input type="text" class="form-control" name="raza"  value="<%out.print(p.getRaza());%> ">
                   </div>
     
     
       <!-- Campo para ingresar la URL de la foto del perro -->
                  <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Foto</span>
                        <!-- Llamamos la imagen -->
                        <input type="file" class="form-control" name="foto" value="<%out.print(p.getImagen());%>" required="true" accept=".jpg, .jpeg">
                        
                   </div>
                        
       
       
        <!-- desplegable para asignar puntos a un  perro -->
                    <select class="form-select" aria-label="Default select example" name="punto">
                        
                        <!-- Opciones de la lista -->
                        <option selected>Puntos</option>
                        <option value="1" <% if (p.getPuntos() == 1) out.print("selected"); %>>1</option>
                        <option value="2" <% if (p.getPuntos() == 2) out.print("selected"); %>>2</option>
                        <option value="3" <% if (p.getPuntos() == 3) out.print("selected"); %>>3</option>
                        <option value="4" <% if (p.getPuntos() == 4) out.print("selected"); %>>4</option>
                        <option value="5" <% if (p.getPuntos() == 5) out.print("selected"); %>>5</option>
                        <option value="6" <% if (p.getPuntos() == 6) out.print("selected"); %>>6</option>
                        <option value="7" <% if (p.getPuntos() == 7) out.print("selected"); %>>7</option>
                        <option value="8" <% if (p.getPuntos() == 8) out.print("selected"); %>>8</option>
                        <option value="9" <% if (p.getPuntos() == 9) out.print("selected"); %>>9</option>
                        <option value="10" <% if (p.getPuntos() == 10) out.print("selected"); %>>10</option>
                      </select>
                <br>
     <!-- Campo para ingresar la edad del perro -->
                        <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Edad</span>
                        <!-- FImprimimos la edad para verificar si la esta llamando -->
                        <input type="number" name="edad" class="form-control" min="0" step="1" value="<%out.print(p.getEdad());%>" required><br>
                        <input type="text" name="editar"  value="si" readonly style="display:none" > <!-- ocultar bandera--->
                        </div> 

      <!-- Boton para enviar el formulario -->          
                 <div class="mb-3">
                     <!-- Boton primario para editar al perro Actual-->
                         <input type="submit" value="Insertar Perro" class="btn btn-primary">
                   </div>
            </form>
             </div>
           </div>
        </div>
    
 
</nav>
              
   
<%@include file="temps/footer.jsp" %>


