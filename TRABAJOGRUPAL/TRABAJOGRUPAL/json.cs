using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TRABAJOGRUPAL
{
    public class json
    {
    }
    public class cliente
    {
        public string documento_tipo { get; set; }
        public string documento_nro { get; set; }
        public string nombre { get; set; }
        public string direccion { get; set; }
    }

    public class Detalle
    {
        public string concepto_codigo { get; set; }
        public string concepto_nombre { get; set; }
        //public string cantidad { get; set; }
        public string importe { get; set; }
        //public string subtotal { get; set; }
    }

    public class Comprobante
    {
        public string fecha { get; set; }
        public string tipo { get; set; }
        public string serie { get; set; }
        public string numero { get; set; }
        public string subtotal { get; set; }
        //public string impuesto { get; set; }
        public string total { get; set; }
        public string moneda { get; set; }
        public cliente cliente { get; set; }
        public List<Detalle> detalle { get; set; }
    }

}
