using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.OleDb;


namespace TrainStation
{
    public partial class _Default : Page
    {

        OleDbConnection cnn = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\kalim\Documents\TrainStationBD.accdb");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                string city = DropdownList1.Items[DropdownList1.SelectedIndex].Value; ;

                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[7] { new DataColumn("ID"), new DataColumn("NumberTrain"), new DataColumn("Direction"), new DataColumn("DateDeparture"), new DataColumn("DateArrival"), new DataColumn("CoupeCount"), new DataColumn("NotACoupeCount") });

                List<string> t = new List<string>() { "ID", "NumberTrain", "Direction", "DateDeparture", "DateArrival", "CoupeCount", "NotACoupeCount" };



                cnn.Open();
                OleDbCommand cmd = new OleDbCommand("SELECT Result.ID, Result.NumberTrain, Result.Direction, Result.DateDeparture, Result.DateArrival, Result.CoupeCount, Result.NotACoupeCount" +
                    " FROM Result WHERE(([Result]![Direction] = \"" + city + "\") AND([Result]![DateDeparture] > #" + TB.Text + "# ) AND ([Result]![CoupeCount] >= " + CoupeCount.Text + ") AND ([Result]![NotACoupeCount]>= " + NotACoupeCount.Text + "));", cnn);
                OleDbDataReader reader2 = cmd.ExecuteReader();

                while (reader2.Read())
                {
                    DataRow data = dt.NewRow();
                    for (int i = 0; i < t.Count; i++)
                    {
                        data[t[i]] = Convert.ToString(reader2.GetValue(reader2.GetOrdinal(t[i])));
                    }
                    dt.Rows.Add(data);
                }

                reader2.Close();
                cnn.Close();

                GridView1.DataSource = dt;
                GridView1.DataBind();

                maintable.Visible = false;

                if (GridView1.Rows.Count < 1)
                {
                    labletable.Visible = true;
                    Label1.Text = "К сожалению в данном направлении нет подходящих рейсов :( ";
                }
                else
                {
                    headerT.Visible = true;
                    tbtn.Visible = true;
                }

            }
            catch
            {
                Response.Write("<script>alert('Все поля должны быть заполнены!');</script>");
            }

        }

        protected void b2_Click(object sender, EventArgs e)
        {
            bool check = false;

            foreach (TableRow row in GridView1.Rows)
            {
                CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                if (chkRow.Checked)
                {
                    check = true;
                }
            }

            if (check)
            {
                int id = 0;
                int coupe = 0;
                int notacoupe = 0;
                string numtrain = null;
                string datedep = null;
                string direction = null;

                foreach (TableRow row in GridView1.Rows)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                    if (chkRow.Checked)
                    {
                        id = Convert.ToInt32(row.Cells[1].Text);
                        coupe = Convert.ToInt32(row.Cells[6].Text);
                        notacoupe = Convert.ToInt32(row.Cells[7].Text);
                        numtrain = row.Cells[2].Text;
                        datedep = row.Cells[4].Text;
                        direction = row.Cells[3].Text;
                    }
                }

                coupe = coupe - Convert.ToInt32(CoupeCount.Text);
                notacoupe = notacoupe - Convert.ToInt32(CoupeCount.Text);

                cnn.Open();
                OleDbCommand cmd = new OleDbCommand("UPDATE Flights SET Flights.CoupeCount = " + coupe + ", Flights.NotACoupeCount = " + notacoupe + " WHERE(((Flights.ID) = " + id + ")); ", cnn);
                cmd.ExecuteNonQuery();

                cnn.Close();

                headerT.Visible = false;
                tbtn.Visible = false;
                GridView1.Visible = false;



                labletable.Visible = true;
                Label1.Text = "Поздравляем! Вы забронировали мест купе: " + CoupeCount.Text + ", мест плацкарт: " + NotACoupeCount.Text + " на поезд №" + numtrain + " по направлению " + direction + ", дата отправления " + datedep + " .";
            }
            else
            {
                Response.Write("<script>alert('Выберите рейс!');</script>");
            }
        }
    }
}