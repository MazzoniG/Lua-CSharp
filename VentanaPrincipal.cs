using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using LuaInterface;
using Lua511;
using System.IO;
using System.Timers;
//using luanet;


namespace LP_LuaCSharp
{
    public partial class VentanaPrincipal : Form
    {
        public Lua lua = new Lua();
        public VentanaPrincipal()
        {
            InitializeComponent();

        }

        public void print(string s) {
            MessageBox.Show(s);
        }

        public void radio(RadioButton rb, TextBox tb)
        {
           if(rb.Name ==  "Bold" && rb.Checked == true){
               tb.Font = new Font(tb.Font, FontStyle.Bold);
           }
           else
           {
               tb.Font = new Font(tb.Font, FontStyle.Regular);
               tb.Font = new Font(tb.Font, FontStyle.Italic);
           }

        }

        private void button1_Click(object sender, EventArgs e)
        {

            try {
                //Funcion que imprime 
                VentanaPrincipal VP = new VentanaPrincipal();
                lua.RegisterFunction("print", VP, VP.GetType().GetMethod("print"));
                lua.RegisterFunction("radio", VP, VP.GetType().GetMethod("radio"));
                lua.DoString(RichTextBox.Text);


                //lua.DoString(RichTextBox.Text);
                //string[] TextBox = RichTextBox.Text.Split(' ');
                //double Variable = (double)lua[TextBox[0]];
                //Console.WriteLine(Variable); 

                } catch(Exception ex){
                }
        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
