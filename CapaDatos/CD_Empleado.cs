using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Empleado
    {
        CD_Conexion db_conexion = new CD_Conexion();

        public DataTable MtMostrar()
        {
            string QryMostrar = "usp_empleados_select";
            SqlDataAdapter adapter = new SqlDataAdapter(QryMostrar, db_conexion.MtdAbrirConexion());
            DataTable dtMostrar = new DataTable();
            adapter.Fill(dtMostrar);
            db_conexion.MtdCerrarConexion();
            return dtMostrar;
        }

        public void MtInsertar(string nombre, string apellido, DateTime fechanac, 
            DateTime fechacon,int depaID, string puestotrabj, decimal salario, string estado )
        {

            string usp_Insertar = "usp_empleados_insert";
            SqlCommand cmd_Query = new SqlCommand(usp_Insertar, db_conexion.MtdAbrirConexion());

            cmd_Query.CommandType = CommandType.StoredProcedure;
            cmd_Query.Parameters.AddWithValue("@Nombre", nombre);
            cmd_Query.Parameters.AddWithValue("@Apellido", apellido);
            cmd_Query.Parameters.AddWithValue("@FechaNacimiento", fechanac);
            cmd_Query.Parameters.AddWithValue("@FechaContratacion", fechacon);
            cmd_Query.Parameters.AddWithValue("@DepartamentoID", depaID);
            cmd_Query.Parameters.AddWithValue("@PuestoTrabajo", puestotrabj);
            cmd_Query.Parameters.AddWithValue("@Salario", salario);
            cmd_Query.Parameters.AddWithValue("@Estado", estado);

            cmd_Query.ExecuteNonQuery();

            db_conexion.MtdCerrarConexion();

        }

        public void MtUpdate(int empleadoID, string nombre, string apellido, DateTime fechanac,
            DateTime fechacon,int depaID, string puestotrabj, decimal salario, string estado)
        {

            string usp_Insertar = "usp_empleados_update";
            SqlCommand cmd_Query = new SqlCommand(usp_Insertar, db_conexion.MtdAbrirConexion());

            cmd_Query.CommandType = CommandType.StoredProcedure;
            cmd_Query.Parameters.AddWithValue("@Nombre", nombre);
            cmd_Query.Parameters.AddWithValue("@Apellido", apellido);
            cmd_Query.Parameters.AddWithValue("@FechaNacimiento", fechanac);
            cmd_Query.Parameters.AddWithValue("@FechaContratacion", fechacon);
            cmd_Query.Parameters.AddWithValue("@DepartamentoID", depaID);
            cmd_Query.Parameters.AddWithValue("@PuestoTrabajo", puestotrabj);
            cmd_Query.Parameters.AddWithValue("@Salario", salario);
            cmd_Query.Parameters.AddWithValue("@Estado", estado);
            cmd_Query.Parameters.AddWithValue("@EmpleadoID", empleadoID);


            cmd_Query.ExecuteNonQuery();

            db_conexion.MtdCerrarConexion();

        }

        public void MtDelete(int empleadoID)
        {
            string usp_Insertar = "usp_empleados_delete";
            SqlCommand cmd_Query = new SqlCommand(usp_Insertar, db_conexion.MtdAbrirConexion());

            cmd_Query.CommandType = CommandType.StoredProcedure;
            cmd_Query.Parameters.AddWithValue("@EmpleadoID", empleadoID);
            cmd_Query.ExecuteNonQuery();

            db_conexion.MtdCerrarConexion();

        }

    }
}
