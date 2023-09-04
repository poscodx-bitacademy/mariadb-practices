package hr.dao.test;

import java.util.List;

import hr.dao.dao.EmployeesDao;
import hr.dao.vo.EmployeesVo;

public class EmployeesDaoTest {

	public static void main(String[] args) {
		testFindByName("mah"); 
	}

	private static void testFindByName(String name) {
		List<EmployeesVo> list = new EmployeesDao().findByName(name);
		for(EmployeesVo vo : list) {
			System.out.println(vo);
		}
	}
}
