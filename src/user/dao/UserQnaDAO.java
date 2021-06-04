package user.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.DBConnection;
import user.vo.UserQnaVo;

public class UserQnaDAO {
	private static UserQnaDAO instance=new UserQnaDAO();
	private UserQnaDAO () {}
	public static UserQnaDAO getInstance() {
		return instance;
	}
	public UserQnaVo productQnaList(int pid) {
		UserQnaVo vo = null;
		String sql = "select * from userqna where pid = " + pid;
		try (Connection con = DBConnection.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					int qid = rs.getInt("qid");
					String qcate = rs.getString("qcate");
					String qpw = rs.getString("qpw");
					String qtitle = rs.getString("qtitle");
					String qcontent = rs.getString("qcontent");
					String qfile = rs.getString("qfile");
					Date qrdate = rs.getDate("qrdate");
					int qlev = rs.getInt("qlev");
					int qref = rs.getInt("qref");
					String mid = rs.getString("mid");
					int pid1 = rs.getInt("pid");
					vo = new UserQnaVo(qid, qcate, qpw, qtitle, qcontent, qfile, qrdate, qlev, qref, mid, pid1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	public ArrayList<UserQnaVo> qlist(int qlev){
		String sql="select * from userqna where qlev=?";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBConnection.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, qlev);
			rs=pstmt.executeQuery();
			ArrayList<UserQnaVo> list=new ArrayList<UserQnaVo>();
			while(rs.next()) {
				int qid = rs.getInt("qid");
				String qcate = rs.getString("qcate");
				String qpw = rs.getString("qpw");
				String qtitle = rs.getString("qtitle");
				String qcontent = rs.getString("qcontent");
				String qfile = rs.getString("qfile");
				Date qrdate = rs.getDate("qrdate");
				qlev = rs.getInt("qlev");
				int qref = rs.getInt("qref");
				String mid = rs.getString("mid");
				int pid = rs.getInt("pid");
				UserQnaVo vo=new UserQnaVo(qid, qcate, qpw, qtitle, qcontent, qfile, qrdate, qlev, qref, mid, pid);
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			DBConnection.close(con, pstmt, rs);
		}
	}
}
