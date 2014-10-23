/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

import Modelo.Compra;
import Modelo.DetalleCompra;
import Modelo.Piqueo;
import Modelo.Producto;
import Modelo.Usuario;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Hashtable;

public class DatosAdmin extends BBDD {

    public DatosAdmin() throws Exception {

        super();
    }

    public Hashtable TrearUsuariosT() throws Exception {
        try {
            Conectar();

            Hashtable Lista = new Hashtable();

            String sql = "Select * from usuarios";
            PreparedStatement sent = CrearSentencia(sql);
            ResultSet rows = Consultar(sent);
            while (rows.next()) {
                int id = (rows.getInt("id"));
                String apellido = (rows.getString("apellido"));
                String nombre = (rows.getString("nombre"));
                String pass = (rows.getString("pass"));
                String direcc = (rows.getString("direccion"));
                int tel = (rows.getInt("telefono"));
                int nivel = (rows.getInt("nivel"));
                int doc = (rows.getInt("documento"));
                int est = (rows.getInt("estado"));
                Usuario aux = new Usuario(id, nombre, apellido, doc, pass, tel, direcc);

                aux.setNivel(nivel);
                aux.setEstado(est);
                Lista.put(aux.getId(), aux);

            }
            return Lista;
        } finally {
            Desconectar();
        }
    }

    public Usuario TraerUsuario(String nomb) throws Exception {
        try {
            Conectar();
            Usuario aux = new Usuario();
            String sql = "select * from usuarios where nombre = '" + nomb + "'";
            PreparedStatement sent = CrearSentencia(sql);
            ResultSet rows = Consultar(sent);
            if (rows.next()) {
                int id_ = (rows.getInt("id"));
                String apellido = (rows.getString("apellido"));
                String nombre = (rows.getString("nombre"));
                String pass = (rows.getString("pass"));
                String direcc = (rows.getString("direccion"));
                int tel = (rows.getInt("telefono"));
                int nivel = (rows.getInt("nivel"));
                int doc = (rows.getInt("documento"));
                int est = (rows.getInt("estado"));
                aux = new Usuario(id_, nombre, apellido, doc, pass, tel, direcc);
                aux.setNivel(nivel);
                aux.setEstado(est);
            }
            return aux;
        } finally {
            Desconectar();
        }
    }
    
    public String TraerUserNombre (int id) throws Exception
    {
         try {
             String nombre = null;
            Conectar();
            String sql = "select nombre from usuarios where id = '"+id+"'";
            PreparedStatement sent = CrearSentencia(sql);
            ResultSet rows = Consultar(sent);
            if (rows.next())
            {
                nombre = rows.getString("nombre");
              
            }
              return nombre;
         }
         finally{
            Desconectar();
         }
    }

        public String TraerNombreProducto(int id)throws Exception
    {
        try
        {
            String nombre = null;
            Conectar();
            String sql = "select nombre from productos where id = '"+id+"'";
             PreparedStatement sent = CrearSentencia(sql);
            ResultSet rows = Consultar(sent);
             if (rows.next()) {
                nombre = rows.getString("nombre");
            }
            return nombre;

        } finally {
            Desconectar();
        }
        
    }
    public Hashtable TraerCompras() throws Exception {
        try {
            Conectar();

            Hashtable lista = new Hashtable();
            String sql = "select * from compra";
            PreparedStatement sent = CrearSentencia(sql);
            ResultSet rows = Consultar(sent);
            while (rows.next()) {
                int id_ = rows.getInt("id");
                int iduser = rows.getInt("idUsuario");
                Date fecha = rows.getDate("fecha");
                float tot = rows.getFloat("total");
                int estado= rows.getInt("estado");
                Compra aux = new Compra(iduser, fecha,estado);
                aux.setIdCompra(id_);
                lista.put(aux.getIdCompra(), aux);
            }
            return lista;

        } finally {
            Desconectar();
        }
    }

    public void ModificarUsuario(Usuario aux) throws Exception {
        try {
            Conectar();
            String sql = "update usuarios set nombre = '" + aux.getNombre() + "', apellido='" + aux.getApellido() + "', pass='" + aux.getPass() + "', direccion='" + aux.getDireccion() + "', telefono= '" + aux.getTelefono() + "', documento='" + aux.getDocumento() + "' where id = '" + aux.getId() + "'";
            PreparedStatement sent = CrearSentencia(sql);
            Actualizar(sent);
        } finally {
            Desconectar();
        }

    }

    public void BajarEstado(int id) throws Exception {
        try {
            Conectar();
            String sql = "update usuarios set estado = 0 where id = " + id + "";
            PreparedStatement sent = CrearSentencia(sql);
            Actualizar(sent);
        } finally {
            Desconectar();
        }

    }

    public void SubirEstado(int id) throws Exception {
        try {
            Conectar();
            String sql = "update usuarios set estado = 1 where id = " + id + "";
            PreparedStatement sent = CrearSentencia(sql);
            Actualizar(sent);
        } finally {
            Desconectar();
        }

    }

    public Usuario TraerUsuario(int id) throws Exception {
        try {
            Conectar();
            Usuario aux = new Usuario();
            String sql = "select * from usuarios where id = '" + id + "'";
            PreparedStatement sent = CrearSentencia(sql);
            ResultSet rows = Consultar(sent);
            if (rows.next()) {
                int id_ = (rows.getInt("id"));
                String apellido = (rows.getString("apellido"));
                String nombre = (rows.getString("nombre"));
                String pass = (rows.getString("pass"));
                String direcc = (rows.getString("direccion"));
                int tel = (rows.getInt("telefono"));
                int nivel = (rows.getInt("nivel"));
                int doc = (rows.getInt("documento"));
                int est = (rows.getInt("estado"));
                aux = new Usuario(id_, nombre, apellido, doc, pass, tel, direcc);

                aux.setNivel(nivel);
                aux.setEstado(est);
            }
            return aux;
        } finally {
            Desconectar();
        }
    }
    
        public Hashtable TraerDetallesCliente(int id) throws Exception {
        try {
            Conectar();
            Hashtable tabla = new Hashtable();
            String sql = "select * from detallecompra where id_compra = '" + id + "'";
            PreparedStatement sent = CrearSentencia(sql);
            ResultSet rows = Consultar(sent);
            while (rows.next()) {
                int det = rows.getInt("id_detalle");
                int comp = rows.getInt("id_compra");
                float prec = rows.getFloat("precio");
                int idprod = rows.getInt("id_producto");
                int cant = rows.getInt("cantidad");
                Piqueo piqueo= TraerPiqueo(rows.getInt("piqueoID"));
                DetalleCompra aux = new DetalleCompra(comp, prec, idprod, cant);
                aux.setIdDetalle(det);
                aux.setPiqueo(piqueo);
                tabla.put(aux.getIdProd(), aux);
            }
            return tabla;
        } finally {
            Desconectar();
        }

    }
    public Piqueo TraerPiqueo(int idPiqueo) throws Exception {
          try
        {
        Conectar();
        Piqueo piqueo=null;
        String sql = "select * from piqueo where idPiqueo = " + idPiqueo + "";
        PreparedStatement sent = CrearSentencia(sql);
        ResultSet rows = Consultar(sent);
        while (rows.next()) {
            String descripcionProducto =rows.getString("descripcion");
            int cantidad= rows.getInt("cantidad");
            Date fecha= rows.getDate("fecha");
            int estado= rows.getInt("estado");
            piqueo= new Piqueo(idPiqueo, descripcionProducto, cantidad, fecha, estado);
        }
        
        return piqueo;
        }
        finally
        {
           Desconectar();
        }
    }
}
