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


        public SqlConnection con = new SqlConnection("data source = 10.15.14.219; initial catalog = alquiler; user id = luis11; password = 123");


    }
}
