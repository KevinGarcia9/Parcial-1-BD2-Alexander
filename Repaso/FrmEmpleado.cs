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
    public partial class FrmEmpleado: Form
    {
        public FrmEmpleado()
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
            
            CD_Empleado mostrar = new CD_Empleado();
            DataTable dtMostrar = mostrar.MtMostrar();
            dtvEmpleado.DataSource = dtMostrar;
        }

        private void FrmVehiculos_Load(object sender, EventArgs e)
        {
            MtdMostrar();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CD_Empleado conn = new CD_Empleado();

            try
            {
                    conn.MtInsertar(
                        txtNombre.Text,
                        txtApellido.Text,
                        DateTime.Parse( txtFechaNac.Text),
                        DateTime.Parse(txtFechaContratacion.Text),
                        int.Parse(txtDepartamentoID.Text),
                        txtPuestoTrabajo.Text,
                        decimal.Parse(txtSalario.Text),
                        cbxEstado.Text
                        );

                MessageBox.Show("El Empleado se agregó con éxito", "Correcto",
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
            CD_Empleado conn = new CD_Empleado();

            try
            {
                conn.MtUpdate(
                    int.Parse(txtEmpleadoID.Text),
                     txtNombre.Text,
                        txtApellido.Text,
                        DateTime.Parse(txtFechaNac.Text),
                        DateTime.Parse(txtFechaContratacion.Text),
                        int.Parse(txtDepartamentoID.Text),
                        txtPuestoTrabajo.Text,
                        decimal.Parse(txtSalario.Text),
                        cbxEstado.Text);

                MessageBox.Show("El Empleado se actualizo con éxito", "Correcto",
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
            CD_Empleado conn = new CD_Empleado();

            try
            {
                conn.MtDelete(
                    int.Parse(txtEmpleadoID.Text));

                MessageBox.Show("El Empleado se elimino con éxito", "Correcto",
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
            txtEmpleadoID.Enabled = false;

            txtEmpleadoID.Text = dtvEmpleado.SelectedCells[0].Value.ToString();
            txtNombre.Text = dtvEmpleado.SelectedCells[1].Value.ToString();
            txtApellido.Text = dtvEmpleado.SelectedCells[2].Value.ToString();
            txtFechaNac.Text = dtvEmpleado.SelectedCells[3].Value.ToString();
            txtFechaContratacion.Text = dtvEmpleado.SelectedCells[4].Value.ToString();
            txtDepartamentoID.Text = dtvEmpleado.SelectedCells[5].Value.ToString();
            txtPuestoTrabajo.Text = dtvEmpleado.SelectedCells[6].Value.ToString();
            txtSalario.Text = dtvEmpleado.SelectedCells[7].Value.ToString();
            cbxEstado.Text = dtvEmpleado.SelectedCells[8].Value.ToString();

        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            txtEmpleadoID.ResetText();
            txtNombre.ResetText();
            txtApellido.ResetText();
            txtFechaNac.ResetText();
            txtFechaContratacion.ResetText();
            txtDepartamentoID.ResetText();
            txtPuestoTrabajo.ResetText();
            txtSalario.ResetText();
            cbxEstado.ResetText();

        }

        private void txtFechaContratacion_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
