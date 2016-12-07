using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class register : System.Web.UI.Page
{
    string filename = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Insert(upload());
    }

    public void Insert(bool fileOK)
    {
        string name = TextBox1.Text;
        string password = TextBox2.Text;
        string address = TextBox4.Text;
        string phone_num = TextBox5.Text;
        int num_max = 0;
        if (TextBox7.Text != null)
        {
            //num_max = Convert.ToInt16(TextBox7.Text.Trim());
        }
        string intro = TextBox8.Text;
        if (fileOK)
        {
            string connStr = ConfigurationManager.ConnectionStrings["connect_string"].ToString();
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                try
                {
                    connection.Open();
                    Response.Write("<script>alert(" + name + password + address + phone_num + num_max + intro + filename + 0 + ")</script>");
                    SqlCommand cmd = new SqlCommand("INSERT INTO store(name,password,address,phone_num,num_max,"
                        + "introduction,pic,is_active) VALUES ('" + name + "','" + password + "','" + address + "','"
                        + phone_num + "','" + num_max + "','" + intro + "','" + filename + "','" + 0 + "')", connection);
                    cmd.ExecuteNonQuery();
                    connection.Close();

                    connection.Open();
                    cmd = new SqlCommand("SELECT * FROM store WHERE name='" + name + "'", connection);
                    using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        string userID = string.Empty;
                        while (reader.Read())
                        {
                            userID = reader["ID"].ToString();
                        }
                        HttpCookie IDcookie = new HttpCookie("ID", userID);
                        IDcookie.Domain = "localhost";
                        IDcookie.Expires = DateTime.Now.AddMinutes(15);
                        Response.Cookies.Add(IDcookie);
                        Response.Redirect("rgstseccess.aspx");
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

    public bool upload()
    {
        Boolean upOK = false;
        Boolean fileOK = false;
        string path = Server.MapPath("~/UploadedImages/");
        if (FileUpload1.HasFile)
        {
            string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            string[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
            for (int i = 0; i < 4; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    fileOK = true;
                }
            }
            if (fileOK)
            {
                try
                {
                    filename = path + FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(filename);
                    upOK = true;

                }
                catch (Exception)
                {
                    Response.Write("<script>alert('头像文件有错，不能上传！')</script>");
                }
            }
        }
        return upOK;
    }

}