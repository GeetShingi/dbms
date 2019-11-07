import java.util.*;
import java.sql.*;

class mysqljdbc
{
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms","user","password");
			stmt = conn.createStatement();
			String sql = "create table students(name varchar(255),roll int not null unique,primary key(roll)";
			System.out.println("Creating table Students");
			stmt.executeUpdate(sql);
			sql = "insert into students values('Geet',1)";
			System.out.println("Inserting record");
			stmt.executeUpdate(sql);
			sql = "insert into students values('Darshan',2)";
			stmt.executeUpdate(sql);
			sql = "select * from students";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				String name = rs.getString("name");
				int roll = rs.getInt("roll");
				System.out.println("Name: "+name);
				System.out.println("Roll: "+roll);
			}
			rs.close();
			sql = "update students set roll=3 where name='geet'";
			stmt.executeUpdate(sql);
			sql = "select * from students";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				String name = rs.getString("name");
				int roll = rs.getInt("roll");
				System.out.println("Name: "+name);
				System.out.println("Roll: "+roll);
			}
			rs.close();
			sql = "delete from students where roll=1";
			System.out.println("Deleting record");
			stmt.executeUpdate(sql);
			sql = "select * from students";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				String name = rs.getString("name");
				int roll = rs.getInt("roll");
				System.out.println("Name: "+name);
				System.out.println("Roll: "+roll);
			}
			rs.close();
			conn.close();
		}	
		catch(Exception e)
		{
			System.out.println("Exception");
		}

	}
}