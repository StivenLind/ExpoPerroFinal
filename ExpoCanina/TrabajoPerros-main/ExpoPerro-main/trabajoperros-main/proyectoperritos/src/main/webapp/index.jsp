        <%-- 
    Document   : index
    Created on : 20/09/2023, 10:56:10 a. m.
    Author     : Grupo 7
--%>

<%@page import="com.umariana.mundo.exposicionPerro"%>
<%@page import="java.io.IOException"%>
<%@include file="temps/header.jsp" %>
       
   <!-- Imagen de encabezado con la clase "PerroBandera" -->

   <image  class= "PerroBandera" src="./img/perro.jpg" width="100%" >
    <div class="row">
    <div class="col">
     <div class="card">
        <div class="card-body" >

   <!-- Formulario para ingresar informaciÃ³n sobre un perro -->

            <form action="SvPerro" method="POST" enctype="multipart/form-data">

   <!-- TÃitulo del formulario -->
                <div class="container text-center">
                 <legend>Ingresar Perro </legend>
                  </div>
    <!-- Campo para ingresar el nombre del perro -->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Nombre</span>
                        <input type="text" class="form-control" name="nombre"  placeholder="Nombre" aria-label="Username" aria-describedby="basic-addon1" required="true">
                   </div>
     <!-- Campo para ingresar la raza del perro -->
                     <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Raza</span>
                        <input type="text" class="form-control" name="raza"  placeholder="Raza" aria-label="Username" aria-describedby="basic-addon1" required="true">
                   </div>
     
     
       <!-- Campo para ingresar la URL de la foto del perro -->
                  <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Foto</span>
                        <input type="file" class="form-control" name="foto"  placeholder="url foto" aria-label="Username" aria-describedby="basic-addon1" required="true" accept=".jpg, .jpeg">
                   </div>
       
       
        <!-- desplegable para asignar puntos a un  perro -->
                    <select class="form-select" aria-label="Default select example" name="punto" required="true" >
                        <option selected>Puntos</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                      </select>
                <br>
     <!-- Campo para ingresar la edad del perro -->
                        <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Edad</span>
                        <input type="number" class="form-control" name="edad"  placeholder="Numero" aria-label="Username" aria-describedby="basic-addon1" required="true">
                        </div> 

      <!-- BotÃ³n para enviar el formulario -->          
                 <div class="mb-3">
                         <input type="submit" value="Insertar Perro" class="btn btn-primary">
                   </div>
            </form>
             </div>
           </div>
        </div>
    <div class="col">
             <div class="card">
     <div class="card-body">
         
         
        <!-- Tabla para mostrar los datos de los perros -->
          <table class="table table-bordered"           >
              <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
   <!-- Desplegable organizar por -->
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Ordenar por
          </a>
          <ul class="dropdown-menu">
   <!-- Redirije al index, a la pagina principal -->
            <li><a class="dropdown-item" href="index.jsp?tipo=nombre">Nombre</a></li>
            <li><a class="dropdown-item" href="index.jsp?tipo=edad">edad</a></li>
            <li><a class="dropdown-item" href="index.jsp?tipo=puntos">puntos</a></li>
          </ul>
        </li>
      </ul>
   <!-- Eliminar perros y llamamos al metodo POST del servlet Eliminar -->
        <form action="EliminarPerroServlet"  method="POST" class="d-flex" role="search">    
        <input class="form-control me-2" type="search"  name="nombreBuscar" placeholder="Ingrese el nombre del perro" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Buscar</button>
      </form>
    </div>
  </div>
</nav>
              
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Raza</th>
                            <th>Foto</th>
                            <th>Puntos</th>
                            <th>Edad</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                  <tbody>
              <%
            //array nulo vacio
            ArrayList <perro> misPerros = null;
            //String Tipo= request.getParameter("Tipo");
            //Parametro de buscar
            String nombreBus= request.getParameter("nombreBuscar");
            String tipo= request.getParameter("tipo");
            //se lo imprime para verificar que se mande
            System.out.println(tipo);
            ServletContext context=  getServletContext();
           //si son nulos entonces
            if (nombreBus==null && tipo==null){
            //se deserializa
            misPerros= exposicionPerro.deserializar( context);}
            //se lo envia como nulo y se lo implime, luego lo ubica y como parametro context y nombreBuscar
            else if (nombreBus!=null && tipo==null){
            System.out.println(nombreBus);
            misPerros= exposicionPerro.ubicarPerroBuscado(nombreBus, context);}
            else if(tipo!=null ){
            
            misPerros= exposicionPerro.ordenarPerro(tipo, context);
                  }
            // Obtener array list de la solicitud
            // Realizamos un cambios de out.print a strong para que la interfaz se adapte mas flexiblemnte
            // Pero respetamos la logica de Java
            
             if (misPerros != null && !misPerros.isEmpty()) {
            //Mensaje de verificacion
                System.out.println("Se cargaron " + misPerros.size() + " perros exitosamente aÃ±adidos");
                for (perro miperro : misPerros) {
                
        %>
   
        <!--  -->
                        <tr>
                            <td><%= miperro .getNombre() %></td>
                            <td><%= miperro .getRaza() %></td>
                            <td><%= miperro .getImagen()%></td>
                            <td><%= miperro .getPuntos() %></td>
                            <td><%= miperro .getEdad() %></td>
                             <td>  <div class="btn-group me-2" role="group" aria-label="First group">
                                        <!--Acciones generadas en la tabla-->
                                     
                                     <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-nombre="<%=miperro.getNombre()%>" ><i class ="fa-solid fa-eye"></i> </a>
                                     
                                     <a href="editarPerro.jsp?nombreEdit=<%=miperro.getNombre()%>" class="btn btn-primary"><i class="fa-solid fa-pen" ></i></a>

                                    <a href ="#" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#eliminarModal" data-nombre="<%=miperro.getNombre()%>"><i class ="fa-solid fa-trash"></i>
                                            </a>

        <!-- Modal de confirmacion de la accion eliminar  -->
   <div class="modal fade" id="eliminarModal" tabindex="-1" role="dialog" aria-labelledby="eliminarModalLabel" aria-hidden="true">
           <div class="modal-dialog" role="document">
               <div class="modal-content">
                   <div class="modal-header">
                       <h5 class="modal-title" id="eliminarModalLabel">Confirmar Eliminación</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
                       </button>
                   </div>
                   <div class="modal-body">
                       ¿Estás seguro de que deseas eliminar este perro?
                   </div>
                   <div class="modal-footer">
                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button> 
                       <!-- Agrega aquí un botón para realizar la eliminación -->
                       <a href="EliminarPerroServlet?perroName=<%=miperro.getNombre()%>" class="btn btn-danger" id="confirmarEliminacion">Eliminar</a>
                   </div>
               </div>
           </div>
       </div
                                   
                                  </div></td>
                        </tr>
           <%
               
                }
            } else {
                out.print("No hay Perros disponibles.");
            }
         %>
                    </tbody>    
                </table>
     </div>
   </div>
    </div>
                    
                    
                  <!-- Modal que muestra los detalles de un perro ingresado -->
     <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
         <div class="modal-dialog"> 
             <div class="modal-content"> 
                 <div class="modal-header"> 
                    <h5 class="modal-title" id="exampleModalLabel">Detalles del Perro</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
                 </div>
                 <div class="modal-body"> 
                  
                     <div id="perro-details"> 
                         <!-- Aquí se añade los detalles del perro-->
                </div>
                 </div> 
                 <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button> 
                </div>
             </div> 
         </div> 
     </div>
           
                           
     <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
         <div class="modal-dialog"> 
             <div class="modal-content"> 
                 <div class="modal-header"> 
                    <h5 class="modal-title" id="exampleModalLabel">Editar perro</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
                 </div>
                 <div class="modal-body"> 
                    <div id="perro-detalles" style="display: flex; justify-content: center;">
                        <ul>
                            <li><a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editRaza" >Editar raza</a></li>
                  <li><a href="#" class="btn btn-success" data-bs-toggle="modal"  data-bs-target="#editFoto" >Editar foto</a></li>
                    <li><a href="#" class="btn btn-success" data-bs-toggle="modal"  data-bs-target="#editPuntos" >Editar puntos</a></li>
                    <li><a href="#"class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editEdad" >Editar edad</a></li>
                        </ul>
                </div>
                       
                </div>
                 </div> 
                 <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button> 
                </div>
             </div> 
         </div> 
                  <!-- cierre del modal  -->
     </div>  
    
   
     
                    
                    
                    


    
<%@include file="temps/footer.jsp" %>


<script>
    // funcion para mostrar los datos en la ventana modal
  $('#exampleModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Botón que desencadenó el evento
    var nombre = button.data('nombre'); // Obtén el nombre del perro

    // Realiza una solicitud AJAX al servlet para obtener los detalles del perro por su nombre
    $.ajax({
      url: 'SvPerro?nombre=' + nombre, // Cambia 'id' por el nombre del parámetro que esperas en tu servlet
      method: 'GET',
      success: function (data) {
        // Actualiza el contenido del modal con los detalles del perro
        $('#perro-details').html(data);
      },
      error: function () {
        // Maneja errores aquí si es necesario y se imprime en consola
        console.log('Error al cargar los detalles del perro.');
      }
    });
  });
  
  
  


</script>
