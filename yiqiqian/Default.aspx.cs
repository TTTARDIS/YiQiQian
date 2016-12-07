using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["connect_string"].ToString();
        using (SqlConnection connection = new SqlConnection(connStr))
        {
            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM store WHERE ID='1'", connection);
                using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (reader.Read())
                    {
                        Image2.ImageUrl = reader["pic"].ToString();
                    }
                }

                connection.Close();
                connection.Open();
                cmd = new SqlCommand("SELECT * FROM store WHERE ID='2'", connection);
                using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (reader.Read())
                    {
                        Image3.ImageUrl = reader["pic"].ToString();
                    }
                }

                connection.Close();
                connection.Open();
                cmd = new SqlCommand("SELECT * FROM store WHERE ID='3'", connection);
                using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (reader.Read())
                    {
                        Image4.ImageUrl = reader["pic"].ToString();
                    }
                }

                connection.Close();
                connection.Open();
                cmd = new SqlCommand("SELECT * FROM store WHERE ID='4'", connection);
                using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (reader.Read())
                    {
                        Image5.ImageUrl = reader["pic"].ToString();
                    }
                }

                connection.Close();
                connection.Open();
                cmd = new SqlCommand("SELECT * FROM store WHERE ID='5'", connection);
                using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (reader.Read())
                    {
                        Image6.ImageUrl = reader["pic"].ToString();
                    }
                }

                connection.Close();
                connection.Open();
                cmd = new SqlCommand("SELECT * FROM store WHERE ID='6'", connection);
                using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (reader.Read())
                    {
                        Image7.ImageUrl = reader["pic"].ToString();
                    }
                }

                connection.Close();
                connection.Open();
                cmd = new SqlCommand("SELECT * FROM store WHERE ID='7'", connection);
                using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (reader.Read())
                    {
                        Image8.ImageUrl = reader["pic"].ToString();
                    }
                }

                connection.Close();
                connection.Open();
                cmd = new SqlCommand("SELECT * FROM store WHERE ID='2'", connection);
                using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (reader.Read())
                    {
                        Image9.ImageUrl = reader["pic"].ToString();
                    }
                }

                connection.Close();
                connection.Open();
                cmd = new SqlCommand("SELECT * FROM store WHERE ID='1'", connection);
                using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (reader.Read())
                    {
                        Image10.ImageUrl = reader["pic"].ToString();
                    }
                }
                connection.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}