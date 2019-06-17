using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace TRABAJOGRUPAL
{

   

    public class Conexion
    {

        //public SqlConnection con = new SqlConnection("data source = 10.15.14.219; initial catalog = alquiler; user id = luis11; password = 123");
        //public static string CadenaConexion = "database=alquiler;data source=.;integrated security=true";
        //public SqlConnection con = new SqlConnection("database=ALQUILER;data source=.;integrated security=true");
        public SqlConnection con = new SqlConnection("Data Source=DESKTOP-BSPKEE5\\SQLEXPRESS; initial catalog = ALQUILER; integrated security = true");


    }
}
