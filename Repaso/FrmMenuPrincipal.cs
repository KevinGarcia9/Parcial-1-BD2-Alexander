﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Repaso
{
    public partial class FrmMenuPrincipal: Form
    {
        public FrmMenuPrincipal()
        {
            InitializeComponent();
        }

        private void vehiculosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            FrmVehiculos nuevoFormulario = new FrmVehiculos();
            nuevoFormulario.Show();
        }
    }
}
