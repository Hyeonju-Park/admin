package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import admin.vo.Admin_ProductVo;
import test.db.DBConnection;

public class Admin_ProductDao {
	private static Admin_ProductDao instance=new Admin_ProductDao();
	private Admin_ProductDao() {}
	public static Admin_ProductDao getInstance() {
		return instance;
	}
	public int insert(Admin_ProductVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into product values(PRODUCT_SEQ.nextval,?,)";
		try {
			con=DBConnection.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getPprice());
			pstmt.setInt(2, vo.getPdiscount());
			pstmt.setString(3, vo.getPimage1());
			pstmt.setString(4, vo.getPimage2());
			pstmt.setString(5, vo.getPimage3());
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			DBConnection.close(con, pstmt, null);
		}
	}
}
