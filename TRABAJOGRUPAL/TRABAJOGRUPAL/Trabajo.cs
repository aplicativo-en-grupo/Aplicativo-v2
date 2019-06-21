using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace TRABAJOGRUPAL
{
    public partial class Trabajo : Form
    {
        public Trabajo()
        {
            InitializeComponent();
        }

        Class1 CL = new Class1();

        private void Form1_Load(object sender, EventArgs e)
        {

            dgv_cliente.DataSource = CL.MOSTRARCLIENTE();

        }

        private void Button1_Click(object sender, EventArgs e)
        {
            TextWriter writer = new StreamWriter(@"C:\Users\usuario\Documents\GitHub\Aplicativo-v2\json.txt");
            for (int i = 0; i < dgv_cliente.Rows.Count-1; i++)
            {
                for (int j = 0; j < dgv_cliente.Columns.Count; j++)
                {
                    writer.Write("\t"+dgv_cliente.Rows[i].Cells[j].Value.ToString()+"\t"+ "|");
                }
                writer.WriteLine("");
                writer.WriteLine("----------------------------------------------------------");
            }
            writer.Close();
            MessageBox.Show("Exportado exitosamente");
        }

    }
}
