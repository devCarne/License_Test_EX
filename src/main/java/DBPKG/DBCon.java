package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBCon {

    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName("oracle.jdbc.OracleDriver");
        return DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    }
}

