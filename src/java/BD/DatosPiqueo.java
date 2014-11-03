/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package BD;

import Modelo.Compra;
import Modelo.DetalleCompra;
import Modelo.Piqueo;
import Modelo.Producto;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Hashtable;

/**
 *
 * @author Yanina
 */
public class DatosPiqueo extends BBDD{
    
    public DatosPiqueo()throws Exception{
        super();
    }
    
        public int maxIdPiqueo() throws Exception {
        try {
            Conectar();
            int id = 0;
            String sql = "select max(id) from piqueo";
            PreparedStatement sent = CrearSentencia(sql);
            ResultSet rows = Consultar(sent);
            if (rows.next()) {
                id = rows.getInt("max(id)");
            }
            return id;

        } finally {
            Desconectar();
        }
    }
        
        
   private Piqueo getbyID(int idPiqueo, int idProducto) throws Exception {
        try {
            Conectar();
            Piqueo piqueo = null;
            String sql = "select * from piqueo where idPiqueo = " + idPiqueo + " and idProducto ="+ idProducto;
            PreparedStatement sent = CrearSentencia(sql);
            ResultSet rows = Consultar(sent);
            while (rows.next()) {
                String descripcionProducto = rows.getString("descripcion");
                int cantidad = rows.getInt("cantidad");
                Date fecha = rows.getDate("fecha");
                int estado = rows.getInt("estado");
                piqueo = new Piqueo(idPiqueo, descripcionProducto, cantidad, fecha, estado,idProducto);

            }

            return piqueo;
        } finally {
            Desconectar();
        }
    }
      public Hashtable traerPiqueo(int idPiqueo) throws Exception {
        Hashtable listaPiqueo= new  Hashtable();
          try {
            Conectar();
            Piqueo piqueo = null;
            String sql = "select * from piqueo where idPiqueo = " + idPiqueo ;
            PreparedStatement sent = CrearSentencia(sql);
            ResultSet rows = Consultar(sent);
            while (rows.next()) {
                String descripcionProducto = rows.getString("descripcion");
                int cantidad = rows.getInt("cantidad");
                Date fecha = rows.getDate("fecha");
                int estado = rows.getInt("estado");
                int idProducto= rows.getInt("idProducto");
                piqueo = new Piqueo(idPiqueo, descripcionProducto, cantidad, fecha, estado,idProducto);
                listaPiqueo.put(idProducto, piqueo);
            }

            return listaPiqueo;
        } finally {
            Desconectar();
        }
    }
      
      
      public Hashtable traerPiqueosPendientes() throws Exception {
        Hashtable listaPiqueo= new  Hashtable();
          try {
            Conectar();
            Piqueo piqueo = null;
            String sql = "select * from piqueo where estado = " + 1 ;
            PreparedStatement sent = CrearSentencia(sql);
            ResultSet rows = Consultar(sent);
            int i=0;
            while (rows.next()) {
                String descripcionProducto = rows.getString("descripcion");
                int cantidad = rows.getInt("cantidad");
                Date fecha = rows.getDate("fecha");
                int estado = rows.getInt("estado");
                int idProducto= rows.getInt("idProducto");
                int idPiqueo= rows.getInt("idPiqueo");
                piqueo = new Piqueo(idPiqueo, descripcionProducto, cantidad, fecha, estado,idProducto);
                listaPiqueo.put(i, piqueo);
                i++;
            }

            return listaPiqueo;
        } finally {
            Desconectar();
        }
    }
   
    
    public int agregarCompraTopiqueo(Hashtable detalle) throws  Exception {
// el metodo devuelve -1 si se ejecuto correctamente y el idCompra si la misma no pudo ser grabada
        
	PreparedStatement preparedStatementModificaStock = null;        
	PreparedStatement preparedStatementInsertaEnPqueo = null;
        PreparedStatement preparedStatementActualizarCompra=null;
        PreparedStatement preparedStatementUpdatePiqueo=null;        

 
	String updatecompra = "UPDATE compra SET estado=? WHERE id=?";
	String updateTableProductos = "UPDATE productos SET stock= stock - ? WHERE id= ?";
        String insertarTablePiqueo= "INSERT INTO piqueo(idPiqueo, cantidad, fecha, estado, descripcion, idProducto) VALUES (?,?,?,?,?,?)";
        String updatePiqueo="UPDATE piqueo SET cantidad= cantidad + ? WHERE idProducto=? and idPiqueo = ?";
        
        int idCompra=0;
        DetalleCompra auxdet=null;
        String prodDescripcion;
        DatosUsuario dao=new DatosUsuario();
        DatosProductos daoProd= new DatosProductos();
        int idPiqueo= maxIdPiqueo()+1;
        
        
	try {
            Conectar();
    	    conexion.setAutoCommit(false);
            Enumeration i = detalle.elements();
            while (i.hasMoreElements()) {// MODIFICA EL STOCK 
                auxdet = new DetalleCompra();
                auxdet = (DetalleCompra) i.nextElement();
                preparedStatementModificaStock = conexion.prepareStatement(updateTableProductos);
                preparedStatementModificaStock.setInt(1,auxdet.getCantidad());
                preparedStatementModificaStock.setInt(2, auxdet.getIdProd());
                preparedStatementModificaStock.executeUpdate();
                
                prodDescripcion= daoProd.TraerNombreProducto(auxdet.getIdProd());
                Piqueo p = getbyID(idPiqueo,auxdet.getIdProd());// verifica si existe una linea de piqueo con mismo cod de prod e idpPROD
                if(p==null){
                //GRABO PIQUEO YA Q NO EXISTE
                    preparedStatementInsertaEnPqueo= conexion.prepareStatement(insertarTablePiqueo);
                    preparedStatementInsertaEnPqueo.setInt(1,idPiqueo);
                    preparedStatementInsertaEnPqueo.setInt(2, auxdet.getCantidad());
                    preparedStatementInsertaEnPqueo.setDate(3,new java.sql.Date(new java.util.Date().getTime()));
                    preparedStatementInsertaEnPqueo.setInt(4, 1);
                    preparedStatementInsertaEnPqueo.setString(5, prodDescripcion);
                    preparedStatementInsertaEnPqueo.setInt(6, auxdet.getIdProd());
                    preparedStatementInsertaEnPqueo.executeUpdate();
                
                }else{
                    preparedStatementUpdatePiqueo.setInt(1, auxdet.getCantidad());
                    preparedStatementUpdatePiqueo.setInt(2, auxdet.getIdProd());
                    preparedStatementUpdatePiqueo.setInt(3, idPiqueo);
                    preparedStatementUpdatePiqueo.executeUpdate();
                }
            }
            idCompra=auxdet.getIdCompra();
            
            //modificar estado de la compra
            preparedStatementActualizarCompra = conexion.prepareStatement(updatecompra);
            preparedStatementActualizarCompra.setInt(1,2 );
            preparedStatementActualizarCompra.setInt(2, idCompra);
	    preparedStatementActualizarCompra.executeUpdate();         
            conexion.commit();
	} catch (SQLException e) {
		conexion.rollback();
                return idCompra;
	} finally {
 		if (preparedStatementModificaStock != null) {
			preparedStatementModificaStock.close();
		}
		if (preparedStatementInsertaEnPqueo != null) {
			preparedStatementInsertaEnPqueo.close();
		}
                if(preparedStatementActualizarCompra!=null){
                    preparedStatementActualizarCompra.close();
                }
                if(preparedStatementUpdatePiqueo!=null){
                    preparedStatementUpdatePiqueo.close();
                }
		if (conexion != null) {
			conexion.close();
		}
 
	}        
        return -1;
    }
    
    public void cambiarEstadoApreparado(int idPiqueo) throws Exception{
         try {
            Conectar();
            String sql = "update piqueo set estado = 2 where idPiqueo = " + idPiqueo;
            PreparedStatement sent = CrearSentencia(sql);
            Actualizar(sent);
        } finally {
            Desconectar();
        }
    }
    
    
}
