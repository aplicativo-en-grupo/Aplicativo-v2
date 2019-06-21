using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Web.Script.Serialization;

namespace TRABAJOGRUPAL
{
    public class Class1
    {


        Conexion CONEXION = new Conexion();

        public DataTable MOSTRARCLIENTE()
        {

            SqlDataAdapter da = new SqlDataAdapter("comprobantexclientexdetalle", CONEXION.con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        /*public class Usuario
        {
            public string id { get; set; }
            public string nombres { get; set; }
            public string apellidos { get; set; }
            public string edad { get; set; }
        }

        public class RootObject
        {
            public List<Usuario> usuarios { get; set; }
        }
        var json = new WebClient().DownloadString("http://x.x.x.x/getjson.php");
        var jsonObj = new JavaScriptSerializer().Deserialize<RootObject>(json);
        foreach (var obj in jsonObj.usuarios)
        {
              DataGridViewRow row = new DataGridViewRow();
        row.CreateCells(dataGridView1);
              row.Cells[0].Value = obj.id;
              row.Cells[1].Value = arreglarEncoding(obj.nombres);
        row.Cells[2].Value = arreglarEncoding(obj.apellidos);
        row.Cells[3].Value = obj.edad;
              dataGridView1.Rows.Add(row);
         }*/
        public class Cliente
        {
            public string documento_tipo { get; set; }
            public string documento_nro { get; set; }
            public string nombre { get; set; }
            public string direccion { get; set; }
        }

        public class Detalle
        {
            public string concepto_codigo { get; set; }
            public string cocenpto_nombre { get; set; }
            public string cantidad { get; set; }
            public string importe { get; set; }
            public string subtotal { get; set; }
        }

        public class Comprobante
        {
            public string fecha { get; set; }
            public string tipo { get; set; }
            public string serie { get; set; }
            public string numero { get; set; }
            public string subtotal { get; set; }
            public string impuesto { get; set; }
            public string total { get; set; }
            public string moneda { get; set; }
            public Cliente cliente { get; set; }
            public List<Detalle> detalle { get; set; }
        }

        public class RootObject
        {
            public Comprobante comprobante { get; set; }
        }

    }
}
