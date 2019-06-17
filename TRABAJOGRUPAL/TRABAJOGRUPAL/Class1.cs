using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

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



    }
}
