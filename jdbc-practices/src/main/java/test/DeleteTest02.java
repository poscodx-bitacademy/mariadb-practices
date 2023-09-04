package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteTest02 {

	public static void main(String[] args) {
		boolean result = deleteDepatmentByNo(2L);
		System.out.println(result ? "성공" : "실패");
	}

	private static boolean deleteDepatmentByNo(long no) {
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			//1. JDBC Driver Class 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			
			//2. 연결하기
			String url = "jdbc:mariadb://192.168.0.172:3307/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");

			//3. SQL 준비
			String sql =
					" delete" +
				    "   from dept" +
					"  where no=?";
			pstmt = conn.prepareStatement(sql);
			
			//4. binding
			pstmt.setLong(1, no);
			
			//5. SQL 실행
			int count = pstmt.executeUpdate();
			
			//6. 결과 처리
			result = count == 1;
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				// 7. 자원정리
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

}
