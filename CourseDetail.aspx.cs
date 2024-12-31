using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Elearning
{
    public partial class CourseDetail : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ToString();
            conn = new SqlConnection(cs);
            conn.Open();
        }

        protected void PopulateMasterCourseDropdown()
        {
            string query = "SELECT MasterCourseName FROM MasterCourses";
            SqlCommand cmd = new SqlCommand(query, conn);
            DropDownListMasterCourse.DataSource = cmd.ExecuteReader();
            DropDownListMasterCourse.DataTextField = "MasterCourseName";
            DropDownListMasterCourse.DataValueField = "MasterCourseName";
            DropDownListMasterCourse.DataBind();

            DropDownListMasterCourse.Items.Insert(0, new ListItem("--Select a Master Course--", ""));
        }

        //protected void ButtonFetch_Click(object sender, EventArgs e)
        //{
        //    string selectedMasterCourse = DropDownListMasterCourse.SelectedValue;
        //    if (!string.IsNullOrEmpty(selectedMasterCourse))
        //    {
        //        string query = $"exec CourseList '{selectedMasterCourse}'";
        //        SqlCommand cmd = new SqlCommand(query, conn);
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        RepeaterCourses.DataSource = reader;
        //        RepeaterCourses.DataBind();
        //        conn.Close();

        //    }


        //}

        protected void ButtonFetch_Click(object sender, EventArgs e)
        {
            string selectedMasterCourse = DropDownListMasterCourse.SelectedValue;

            if (!string.IsNullOrEmpty(selectedMasterCourse))
            {
                // Query for individual course details
                string query = $"exec CourseList '{selectedMasterCourse}'";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                //SqlDataReader reader = cmd.ExecuteReader();
                //string photoPath = reader["Photo"].ToString();
                //Image1.ImageUrl = string.IsNullOrEmpty(photoPath) ? "default-photo.jpg" : photoPath;

                RepeaterCourses.DataSource = reader;
                RepeaterCourses.DataBind();


                // Query for master course (aggregated data)
                string queryMasterCourse = $@"
            SELECT 
                mc.MasterCourseName,
                STRING_AGG(c.CourseName, ', ') AS CourseNames, 
                STRING_AGG(c.Description, ', ') AS Descriptions,
                SUM(c.Price) AS TotalPrice,
                mc.Pic
            FROM 
                Course c
            JOIN 
                MasterCourses mc ON c.MasterCourseName = mc.MasterCourseName
            WHERE 
                mc.MasterCourseName = @MasterCourseName
            GROUP BY 
                mc.MasterCourseName,mc.Pic
        ";

                SqlCommand cmdMaster = new SqlCommand(queryMasterCourse, conn);
                cmdMaster.Parameters.AddWithValue("@MasterCourseName", selectedMasterCourse);

                SqlDataReader readerMaster = cmdMaster.ExecuteReader();
                RepeaterMasterCourse.DataSource = readerMaster;
                RepeaterMasterCourse.DataBind();
                readerMaster.Close();
            }
        }




    }
}

        
    
