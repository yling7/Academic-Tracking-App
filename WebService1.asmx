<%@ WebService Language="C#" Class="WebService1" %>

using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Web;
using System.Web.Services;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService1 : System.Web.Services.WebService
{
    public AccountServices()
    {
       [WebMethod]
    public void RequestAccount(string uid, string university, string fname, string lname, string pass, string major)
    {
        string sqlConnectString = System.Configuration.ConfigurationManager.ConnectionStrings["pentest"].ConnectionString;
        string sqlSelect = "INSERT INTO User_Account (user_ID, University_name, Fname, Lname, Password, Major) VALUES (@uidValue, @uniValue, @fnameValue, @lnameValue, @passValue, @majorValue); SELECT LAST_INSERT_ID();";

        MySqlConnection sqlConnection = new MySqlConnection(sqlConnectString);
        MySqlCommmand sqlCommand = new MySqlCommand(sqlSelect, sqlConnection);

        sqlCommand.Parameters.AddWithValue("@uidValue", HttpUtility.UrlDecode(uid));
        sqlCommand.Parameters.AddWithValue("@uniValue", HttpUtility.UrlDecode(university));
        sqlCommand.Parameters.AddWithValue("@fnameValue", HttpUtility.UrlDecode(fname));
        sqlCommand.Parameters.AddWithValue("@lnameValue", HttpUtility.UrlDecode(lname));
        sqlCommand.Parameters.AddWithValue("@passValue", HttpUtility.UrlDecode(pass));
        sqlCommand.Parameters.AddWithValue("@majorValue", HttpUtility.UrlDecode(major));

        sqlConnection.Open();

        try
        {
            int accountId = Convert.ToInt32(sqlCommand.ExecuteScalar());
        }
        catch (Exception e)
        {
            sqlConnection.Close();
        }


    }
}

// WEB SERVICE EXAMPLE
// The HelloWorld() example service returns the string Hello World.

[WebMethod]
public string HelloWorld()
{
    return "Hello World";
}
}
