package hr.dao.test;

import java.util.List;

import hr.dao.dao.EmployeesDao;
import hr.dao.vo.EmployeesVo;

public class EmployeesDaoTest {

	public static void main(String[] args) {
		// testFindByName("mah");
		testFindBySalary(10000, 50000);
	}

	private static void testFindBySalary(int minSalary, int maxSalary) {
		List<EmployeesVo> list = new EmployeesDao().findBySalary(minSalary, maxSalary);
		int count = 0;
		for(EmployeesVo vo : list) {
			if(count >= 10) {
				break;
			}
			System.out.println(vo);
			count++;
		}
	}

	private static void testFindByName(String name) {
		List<EmployeesVo> list = new EmployeesDao().findByName(name);
		for(EmployeesVo vo : list) {
			System.out.println(vo);
		}
	}
}
