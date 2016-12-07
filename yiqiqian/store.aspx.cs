using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class store : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        if (id != null)
        {
            string connStr = ConfigurationManager.ConnectionStrings["connect_string"].ToString();
            using (SqlConnection connection = new SqlConnection(connStr))
            {

                try
                {
                    connection.Open();
                    SqlCommand cmd_store = new SqlCommand("SELECT * FROM store WHERE ID='" + id + "'", connection);
                    SqlCommand cmd_discount = new SqlCommand("SELECT * FROM discount WHERE store_id='" + id + "'", connection);
                    SqlCommand cmd_introduction = new SqlCommand("SELECT * FROM introduction WHERE store_id='" + id + "'", connection);
                    SqlDataReader reader_store = cmd_store.ExecuteReader(CommandBehavior.CloseConnection);

                    while (reader_store.Read())
                    {
                        Label1.Text = reader_store["name"].ToString();
                        Image2.ImageUrl = reader_store["pic"].ToString();
                        Label2.Text = "当前签到人数为：" + reader_store["num_now"].ToString();
                        if (Convert.ToInt16(reader_store["num_now"]) <= (2 * Convert.ToInt16(reader_store["num_max"]) / 3))
                        {
                            Label3.Text = "忙碌程度：清闲(最完美的服务)";
                        }
                        else if (Convert.ToInt16(reader_store["num_now"]) > (2 * Convert.ToInt16(reader_store["num_max"]) / 3))
                        {
                            Label3.Text = "忙碌程度：适中(不用等座)";
                        }
                        else if (Convert.ToInt16(reader_store["num_now"]) > Convert.ToInt16(reader_store["num_max"]))
                        {
                            Label3.Text = "忙碌程度：忙碌(可能需要等座)";
                        }
                        Label5.Text = reader_store["intro_detail"].ToString();
                    }
                    reader_store.Close();
                    connection.Close();
                    connection.Open();
                    SqlDataReader reader_discount = cmd_discount.ExecuteReader(CommandBehavior.CloseConnection);
                    while (reader_discount.Read())
                    {
                        Label4.Text = reader_discount["day"].ToString() + reader_discount["time_start"].ToString() + "-"
                            + reader_discount["time_end"].ToString() + " " + reader_discount["content"].ToString() + "<br />";
                    }
                    Image3.Visible = false;
                    Label7.Text = "";
                    reader_discount.Close();
                    connection.Close();
                    connection.Open();
                    SqlDataReader reader_introduction = cmd_introduction.ExecuteReader(CommandBehavior.CloseConnection);
                    while (reader_introduction.Read())
                    {
                        Image newImage = new Image();
                        newImage.CssClass = "m_pic";
                        newImage.ImageUrl = reader_introduction["pic"].ToString();
                        Panel1.Controls.Add(newImage);
                        Label newlabel = new Label();
                        newlabel.CssClass = "command";
                        newlabel.Text = reader_introduction["content"].ToString();
                        Panel1.Controls.Add(newlabel);
                    }
                    reader_introduction.Close();
                    connection.Open();
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
    }
}