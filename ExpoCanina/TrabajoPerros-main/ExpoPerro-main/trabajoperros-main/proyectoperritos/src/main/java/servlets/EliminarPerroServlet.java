package servlets;

import com.umariana.mundo.exposicionPerro;
import java.util.ArrayList;
import servlets.SvPerro;
import com.umariana.mundo.perro;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Grupo 7
 */
@WebServlet(urlPatterns = {"/EliminarPerroServlet"})

public class EliminarPerroServlet extends HttpServlet {
SvPerro svPerro = new SvPerro();
        // añadido Dentro de un método estático
perro miPerro = new perro(); // Crea una instancia de perro
String nombre = miPerro.getNombre(); // Llama a getNombre() en la instancia
//creacion array tipo perro llamando a los perros
ArrayList <perro> misperros = svPerro.division;

        protected void doGet(HttpServletRequest request, HttpServletResponse response)
        //excepciones para cada caso
            throws ServletException, IOException {
            ServletContext context =getServletContext();
            String nombreE=request.getParameter("perroName"); //Llama a nombre de perro
            exposicionPerro.eliminarPerro(context, nombreE); //elimina el perro por medio del nombreE
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
            
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            System.out.println("Entraaa"); //consola para verificar que ingresa a las demas jsp
            String nombreB=request.getParameter("nombreBuscar");//llamamos al nombre que vamos a buscar
            System.out.println(nombreB); //nombreB de noombre buscar
            request.getRequestDispatcher("index.jsp?nombreBuscar="+nombreB).forward(request, response); //se conecta el index jsp con el nombre buscar y se contatena con el nombre que se buscara y se añadira
        }
    

}
    
