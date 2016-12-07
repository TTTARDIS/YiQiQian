using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        this.Log(TextBox1.Text, TextBox2.Text);
    }

    public void Log(string username, string password)
    {
        string connStr = ConfigurationManager.ConnectionStrings["connect_string"].ToString();
        using (SqlConnection connection = new SqlConnection(connStr))
        {
            /* connection.Open();
             SqlCommand cmd = new SqlCommand("SELECT * FROM test WHERE test_id='1'",connection);
             TextBox1.Text = cmd.ExecuteReader().ToString();*/
            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM store WHERE name='" + username
                    + "' AND password='" + password + "'", connection);
                using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    string name = string.Empty;
                    string pwd = string.Empty;
                    string userID = string.Empty;
                    while (reader.Read())
                    {
                        name = reader["name"].ToString();
                        pwd = reader["password"].ToString();
                        userID = reader["ID"].ToString();
                    }
                    if (name.Trim() == username.Trim() && pwd.Trim() == password.Trim())
                    {
                        //Response.Cookies["username"].Value = name.Trim();
                        //Response.Cookies["password"].Value = password.Trim();
                        //Response.Cookies["ID"].Value = userID
                        //Response.Write("<script>alert("+Response.Cookies["ID"]+")</script>");

                        HttpCookie IDcookie = new HttpCookie("ID", userID);
                        IDcookie.Domain = "localhost";
                        IDcookie.Expires = DateTime.Now.AddMinutes(15);
                        Response.Cookies.Add(IDcookie);

                        Response.Redirect("logseccess.aspx");

                    }
                    else
                    {
                        Response.Write("<script>alert('用户名或密码错误，请重试！')</script>");
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
