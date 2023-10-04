/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.mundo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

/**
 *
 * @author Grupo 7
 */
public class exposicionPerro {
    
    //Array donde se guradan los perros
  public ArrayList <perro> darPerros = new ArrayList<>();
  
   public static ArrayList<perro> deserializar ( ServletContext context){
        ArrayList <perro> misPerros = null;
        // Obtener la ruta real del archivo de datos
        String dataPath = context.getRealPath("/Data/datosperros.ser");

            // Repetimos el proceso de carga de datos porque:
            // Si invocas directamente la pagina JSP de listar videos, el request no tiene el atributo que estas buscando
        File archivo = new File(dataPath);
          try {
                if (archivo.exists()) {
                    //llamar al dataPath
                    FileInputStream fis = new FileInputStream(dataPath);
                    //Crea el objeto
                    ObjectInputStream ois = new ObjectInputStream(fis);
                    //Se conectan entre si 
                    misPerros = (ArrayList<perro>) ois.readObject();
                    //Cerramos ois con la funcion .close
                    ois.close();
                    //imprimimos en consola para saber que si se mandan 
                    System.out.println("Datos de perros cargados exitosamente desde: " + dataPath);
                }
                } catch (IOException e) {
                    e.printStackTrace();
                    // Manejar el error aqui­, por ejemplo, registrandolo o tomando medidas adecuadas.
                } catch (ClassNotFoundException ex) {
          Logger.getLogger(exposicionPerro.class.getName()).log(Level.SEVERE, null, ex);
      }
      return misPerros;
   }
    public static void guardarDatosPerro(ArrayList<perro> misPerros,ServletContext context) {
        try {
           
            String dataPath = context.getRealPath("/Data");

            File dataFolder = new File(dataPath);
            if (!dataFolder.exists()) {
                dataFolder.mkdirs();
            }
            String filePath = dataPath + File.separator + "datosperros.ser";
            FileOutputStream fos = new FileOutputStream(filePath);
            ObjectOutputStream oos = new ObjectOutputStream(fos);
            oos.writeObject(misPerros);
            oos.close();
            //lo que se imprime en la pantalla si los datos no son nulos 
            System.out.println("los datos de videos guardados exitosamente!!: " + filePath);
        } catch (IOException e) {
          e.printStackTrace();
            System.out.println("Error al guardar los datos de el video añadido: " + e.getMessage());
        }
        
    }
    
    public static perro BuscarPerroPorNombre(String nombre, ArrayList<perro> division){
        for( perro i : division){
            
            if (i.getNombre().equals(nombre)){
                
                return i; // retorna le perro si se encuentra 
            }
        }
        return null; // retorna null si no se encuentra el perro
    }
    
    public static void eliminarPerro (ServletContext context, String nombreE){
        ArrayList <perro> perros = deserializar(context);
        for (int i = 0; i < perros.size(); i++) {
            perro p = perros.get(i);
          if (p.getNombre().equals(nombreE)){
              perros.remove(p);
          }  
        }
        guardarDatosPerro(perros, context);
    }
     
    public static  ArrayList<perro> ubicarPerroBuscado(String nombreBus, ServletContext context){
        ArrayList <perro> perros = new ArrayList<>();
        ArrayList <perro> perrosl = deserializar(context);
        for( perro i : perrosl ){
            
            if (i.getNombre().equals(nombreBus)){
                perro miPerro= new perro(i.getNombre(), i.getRaza(), i.getImagen(), i.getPuntos(),i.getEdad());
                System.out.println("------------------");
                System.out.println(miPerro);
                perros.add(miPerro);
                
               
            }
        }
       return perros;
        
        
    }
    public static ArrayList<perro> ordenarPerro(String tipo, ServletContext context){
         ArrayList <perro> perros = deserializar(context);
        switch(tipo){
            case "nombre":
//                Collections.sort(perros, Comparator.comparing(perro::getNombre));
                            Collections.sort(perros, (p1, p2) -> p1.getNombre().toLowerCase().compareTo(p2.getNombre().toLowerCase()));

                break;
            case "edad":
                 Collections.sort(perros, Collections.reverseOrder(Comparator.comparing(perro::getEdad)));
                break;
            case "puntos":
                 Collections.sort(perros, Collections.reverseOrder(Comparator.comparing(perro::getPuntos)));
                break;

        }
                
       return perros; 
    }
}
