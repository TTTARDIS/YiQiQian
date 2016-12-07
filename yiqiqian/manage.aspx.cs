using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class manage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["ID"] == null)
        {
            Response.Redirect("~/mngfault.aspx");
        }
        else
        {
            if (Request.Cookies["ID"] != null)
            {
                string connStr = ConfigurationManager.ConnectionStrings["connect_string"].ToString();
                using (SqlConnection connection = new SqlConnection(connStr))
                {
                    try
                    {
                        connection.Open();
                        string cmdstring = "SELECT * FROM store WHERE ID='"
                            + Convert.ToInt16(Request.Cookies["ID"].Value.ToString()) + "'";
                        SqlCommand cmd_store = new SqlCommand(cmdstring, connection);
                        cmdstring = "SELECT * FROM discount WHERE store_id='"
                            + Convert.ToInt16(Request.Cookies["ID"].Value.ToString()) + "'";
                        SqlCommand cmd_discount = new SqlCommand(cmdstring, connection);
                        cmdstring = "SELECT * FROM introduction WHERE store_id='"
                            + Convert.ToInt16(Request.Cookies["ID"].Value.ToString()) + "'";
                        SqlCommand cmd_introduction = new SqlCommand(cmdstring, connection);

                        SqlDataReader reader_store = cmd_store.ExecuteReader(CommandBehavior.CloseConnection);

                        while (reader_store.Read())
                        {
                            Label1.Text = reader_store["name"].ToString();
                            Label2.Text = "当前签到人数为：" + reader_store["num_now"].ToString();
                            TextBox3.Text = reader_store["introduction"].ToString();
                            TextBox4.Text = reader_store["intro_detail"].ToString();
                        }
                        reader_store.Close();
                        connection.Close();

                        connection.Open();
                        SqlDataReader reader_discount = cmd_discount.ExecuteReader(CommandBehavior.CloseConnection);
                        Label3.Text = "暂无折扣。";
                        while (reader_discount.Read())
                        {
                            if (Convert.ToInt16(reader_discount["is_available"]) == Convert.ToInt16(Request.Cookies["ID"].Value.ToString()))
                            {
                                Label3.Text = reader_discount["day"].ToString() + reader_discount["time_start"].ToString() + "-"
                                    + reader_discount["time_end"].ToString() + " " + reader_discount["content"].ToString();
                            }
                            while (reader_discount.Read())
                            {
                                Label newlabel = new Label();
                                newlabel.CssClass = "m_intro";
                                newlabel.Text += reader_discount["day"].ToString() + reader_discount["time_start"].ToString() + "-"
                                    + reader_discount["time_end"].ToString() + " " + reader_discount["content"].ToString();
                                Panel2.Controls.Add(newlabel);
                            }
                        }
                        reader_discount.Close();
                        connection.Close();

                        connection.Open();
                        SqlDataReader reader_introduction = cmd_introduction.ExecuteReader(CommandBehavior.CloseConnection);
                        Label4.Text = "暂无今日推荐";
                        while (reader_introduction.Read())
                        {
                            reader_introduction.Read();
                            Image2.Visible = true;
                            Image2.ImageUrl = reader_introduction["pic"].ToString();
                            Label4.Text = reader_introduction["content"].ToString();
                            while (reader_introduction.Read())
                            {
                                Image newImage = new Image();
                                newImage.CssClass = "m_pic";
                                newImage.ImageUrl = reader_introduction["pic"].ToString();
                                Panel1.Controls.Add(newImage);
                                Label newlabel = new Label();
                                newlabel.CssClass = "m_intro";
                                newlabel.Text = reader_introduction["content"].ToString();
                                Panel1.Controls.Add(newlabel);
                            }
                        }
                        reader_introduction.Close();
                        connection.Close();
                    }
                    catch (Exception)
                    {
                        throw;
                    }
                }
            }
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["connect_string"].ToString();
        using (SqlConnection connection = new SqlConnection(connStr))
        {
            try
            {
                connection.Open();
                if (TextBox3.Text != null && Request.Cookies["ID"].Value != null)//Convert.ToInt16(Request.Cookies["ID"].Value.ToString())" + TextBox3.Text + "
                {
                    string text = TextBox3.Text;
                    String cmdstring = "UPDATE store SET introduction='" + text + "' WHERE ID='" + Convert.ToInt16(Request.Cookies["ID"].Value.ToString()) + "'";
                    SqlCommand cmd_store = new SqlCommand(cmdstring, connection);
                    cmd_store.ExecuteNonQuery();
                    connection.Close();
                }
                else
                {
                    Response.Write("<script>alert('没有修改！')</script>");
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["connect_string"].ToString();
        using (SqlConnection connection = new SqlConnection(connStr))
        {
            //try
            {
                connection.Open();
                string cmdstring = "UPDATE store SET intro_detail='" + TextBox4.Text +
                    "' WHERE ID='" + Convert.ToInt16(Request.Cookies["ID"].Value.ToString()) + "'";
                SqlCommand cmd_store = new SqlCommand(cmdstring, connection);
                cmd_store.ExecuteNonQuery();
                connection.Close();
            }
            //catch (Exception)
            {
                //throw;
            }
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["connect_string"].ToString();
        using (SqlConnection connection = new SqlConnection(connStr))
        {
            //try
            {
                connection.Open();
                //string cmdstring = "UPDATE discount SET is_available='0' WHERE ID='" + Convert.ToInt16(Request.Cookies["ID"].Value.ToString()) + "'";
                string cmdstring = "SELCET * FROM discount";
                SqlCommand cmd_discount = new SqlCommand(cmdstring, connection);
                //cmd_discount.ExecuteNonQuery();
                Response.Write("<script>alert('删除失败！')</script>");
                connection.Close();
            }
            //catch (Exception)
            {
                // throw;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string day = DropDownList1.Text;
        string time_start = DropDownList2.Text;
        string time_end = DropDownList3.Text;
        string content = TextBox1.Text;

        string connStr = ConfigurationManager.ConnectionStrings["connect_string"].ToString();
        using (SqlConnection connection = new SqlConnection(connStr))
        {
            //try
            {
                connection.Open();
                string cmdstring = "INSERT INTO discount(day,time_start,time_end,store_id,content,is_available)"
                    + "VALUES ('" + day + "','" + time_start + "','" + time_end + "','" + Convert.ToInt16(Request.Cookies["ID"].Value.ToString())
                    + "','" + TextBox1.Text + "','" + 1 + "')";
                SqlCommand cmd = new SqlCommand(cmdstring, connection);
                cmd.ExecuteNonQuery();
                connection.Close();
            }
            //catch (Exception)
            {
                //throw;
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Boolean fileOK = false;
        string filename = "";
        string path = Server.MapPath("~/UploadedImages/");
        if (FileUpload1.HasFile)
        {
            string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            string[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
            for (int i = 0; i < 4; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    Response.Write("<script>alert(" + filename + ")</script>");
                    fileOK = true;
                }
            }
            if (fileOK)
            {
                try
                {
                    filename = path + FileUpload1.FileName;
                    Response.Write("<script>alert("+filename+")</script>");
                    FileUpload1.PostedFile.SaveAs(filename);
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('文件有错，不能上传！')</script>");
                }
            }
        }
        string connStr = ConfigurationManager.ConnectionStrings["connect_string"].ToString();
        using (SqlConnection connection = new SqlConnection(connStr))
        {
            // try
            {
                connection.Open();
                string cmdstring = "INSERT INTO introduction(store_id,pic,content,available)"
                    + "VALUES ('" + Convert.ToInt16(Request.Cookies["ID"].Value.ToString()) + "','" + filename + "','"
                    + TextBox2.Text + "','" + 1 + "')";
                SqlCommand cmd = new SqlCommand(cmdstring, connection);
                cmd.ExecuteNonQuery();
                connection.Close();
            }
            //catch (Exception)
            {
                //  throw;
            }
        }
    }
}
