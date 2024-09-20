package bookInfo;

import java.sql.*;

import DBConnection.DBConnectionMgr;

public class BookListMgr {
	
	private DBConnectionMgr pool;
	
	public BookListMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	//�帣�� ���� �� �Խù� ��
	public int getTotalCounnt(String keyField) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			
			if(keyField.equals("null") || keyField.equals("")) {
				//���� ���� ��ü ���ڵ�
				sql = "select count(bookid) from booktbl";
				pstmt = con.prepareStatement(sql);
			}else {
				//���� ���� ���ڵ�
				//sql = "select count(bookid) from booktbl where"
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
}
