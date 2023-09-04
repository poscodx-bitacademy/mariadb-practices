package hr.dao.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hr.dao.vo.EmployeesVo;

public class EmployeesDao {

	public List<EmployeesVo> findByName(String keyword) {
		List<EmployeesVo> result = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//1. JDBC Driver Class 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			
			//2. 연결하기
			String url = "jdbc:mariadb://192.168.0.172:3307/employees?charset=utf8";
			conn = DriverManager.getConnection(url, "hr", "hr");

			//3. SQL 준비
			String sql =
				"select emp_no, first_name, last_name" +
			    "  from employees" +
				" where first_name like ?" +
				"   and last_name like ?";
			pstmt = conn.prepareStatement(sql);
			
			//4. binding
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			
			//5. SQL 실행
			rs = pstmt.executeQuery();
			
			//6. 결과 처리
			while(rs.next()) {
				Long empNo = rs.getLong(1);
				String firstName = rs.getString(2);
				String lastName = rs.getString(3);
				
				EmployeesVo vo = new EmployeesVo();
				vo.setEmpNo(empNo);
				vo.setFirstName(firstName);
				vo.setLastName(lastName);
				
				result.add(vo);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				// 6. 자원정리
				if(rs != null) {
					rs.close();
				}
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

	public List<EmployeesVo> findBySalary(int minSalary, int maxSalary) {
		List<EmployeesVo> result = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//1. JDBC Driver Class 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			
			//2. 연결하기
			String url = "jdbc:mariadb://192.168.0.172:3307/employees?charset=utf8";
			conn = DriverManager.getConnection(url, "hr", "hr");

			//3. SQL 준비
			String sql =
				"   select a.first_name, b.salary" +
				"     from employees a, salaries b" +
				"    where a.emp_no = b.emp_no" +
				"      and b.to_date = '9999-01-01'" +
				"      and b.salary <= ?" +
				"      and b.salary >= ?" +
				" order by b.salary desc, a.first_name asc";
			pstmt = conn.prepareStatement(sql);
			
			//4. binding
			pstmt.setInt(1, maxSalary);
			pstmt.setInt(2, minSalary);
			
			//5. SQL 실행
			rs = pstmt.executeQuery();
			
			//6. 결과 처리
			while(rs.next()) {
				String firstName = rs.getString(1);
				int salary = rs.getInt(2);
				
				EmployeesVo vo = new EmployeesVo();
				vo.setFirstName(firstName);
				vo.setSalary(salary);
				
				result.add(vo);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				// 6. 자원정리
				if(rs != null) {
					rs.close();
				}
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
