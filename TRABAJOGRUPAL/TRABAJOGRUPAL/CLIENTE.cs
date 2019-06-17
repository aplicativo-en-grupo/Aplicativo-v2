using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TRABAJOGRUPAL
{
    public partial class CLIENTE : Form
    {
        public CLIENTE()
        {
            InitializeComponent();
        }

        Class1 CL = new Class1();

        private void Form1_Load(object sender, EventArgs e)
        {

            dgv_cliente.DataSource = CL.MOSTRARCLIENTE();

        }
    }
}
