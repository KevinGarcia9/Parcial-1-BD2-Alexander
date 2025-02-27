using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaDatos;

namespace Repaso
{
    public partial class FrmVehiculos: Form
    {
        public FrmVehiculos()
        {
            InitializeComponent();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Hide();
            FrmMenuPrincipal nuevoFormulario = new FrmMenuPrincipal();
            nuevoFormulario.Show();
        }

        public void MtdMostrar()
        {
            
            CD_Vehiculo mostrar = new CD_Vehiculo();
            DataTable dtMostrar = mostrar.MtMostrar();
            dtvVehiculos.DataSource = dtMostrar;
        }

        private void FrmVehiculos_Load(object sender, EventArgs e)
        {
            MtdMostrar();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CD_Vehiculo conn = new CD_Vehiculo();

            try
            {
                    conn.MtInsertar(
                        txtMarca.Text,
                        txtModelo.Text,
                        int.Parse(txtAño.Text),
                        decimal.Parse(txtPrecio.Text),
                        cbxEstado.Text);

                MessageBox.Show("El Vehiculo se agregó con éxito", "Correcto",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, "Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            MtdMostrar();
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            CD_Vehiculo conn = new CD_Vehiculo();

            try
            {
                conn.MtUpdate(
                    int.Parse(txtVehiculoID.Text),
                    txtMarca.Text,
                    txtModelo.Text,
                    int.Parse(txtAño.Text),
                    decimal.Parse(txtPrecio.Text),
                    cbxEstado.Text);

                MessageBox.Show("El Vehiculo se actualizo con éxito", "Correcto",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, "Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            MtdMostrar();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            CD_Vehiculo conn = new CD_Vehiculo();

            try
            {
                conn.MtDelete(
                    int.Parse(txtVehiculoID.Text));

                MessageBox.Show("El Vehiculo se elimino con éxito", "Correcto",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, "Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            MtdMostrar();
        }

        private void dtvVehiculos_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtVehiculoID.Enabled = false;

            txtVehiculoID.Text = dtvVehiculos.SelectedCells[0].Value.ToString();
            txtMarca.Text = dtvVehiculos.SelectedCells[1].Value.ToString();
            txtModelo.Text = dtvVehiculos.SelectedCells[2].Value.ToString();
            txtAño.Text = dtvVehiculos.SelectedCells[3].Value.ToString();
            txtPrecio.Text = dtvVehiculos.SelectedCells[4].Value.ToString();
            cbxEstado.Text = dtvVehiculos.SelectedCells[5].Value.ToString();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            txtVehiculoID.ResetText();
            txtMarca.ResetText();
            txtModelo.ResetText();
            txtAño.ResetText();
            txtPrecio.ResetText();
            cbxEstado.ResetText();

        }
    }
}
