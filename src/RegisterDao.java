import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterDao {
	private String dburl ="jdbc:mysql://localhost:3306/jspShoppingCart?serverTimezone=UTC";
	private String dbuname ="root";
	private String dbpass ="1234";
	private String dbdriver="com.mysql.cj.jdbc.Driver";
	
	public void loadDriver(String dbdriver) {
		
		try {
			Class.forName(dbdriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Connection getConnection() {
		Connection con = null;
		try {
			
			con = DriverManager.getConnection(dburl,dbuname, dbpass);
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;
	}
	
	public String insert(Member member) {
		loadDriver(dbdriver);
		Connection con = getConnection();
		String result ="Data Entered Successfully!!!";
		String sql = "insert into member values (?,?,?,?)";
		try {
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setString(1, member.getUname());
			ps.setString(2, member.getPass());
			ps.setString(3, member.getEmail());
			ps.setString(4, member.getPhone());
			ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			result = "Data Not Entered!!!";
			// TODO: handle exception
		}
		return result;
	}
	
	public String insertFlower(Flower flower) {
		loadDriver(dbdriver);
		Connection con = getConnection();
		String result ="Data Entered Successfully!!!";
		String sql = "insert into flowers values (?,?,?)";
		try {
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setString(1,flower.getFname());
			ps.setString(2, flower.getFcolor());
			ps.setString(3, flower.getQuantity());
			ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			result = "Data Not Entered!!!";
			// TODO: handle exception
		}
		return result;
	}


		
	public boolean validate1(Member member) throws ClassNotFoundException {
        boolean status = false;

        
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql ="select * from member where uname=? and pass=?";

        try {
        	System.out.println("validate....");
            PreparedStatement preparedStatement = con.prepareStatement(sql); 
            preparedStatement.setString(1, member.getUname());
            preparedStatement.setString(2, member.getPass());
            
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();
            

        }catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
    }
	
	private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
