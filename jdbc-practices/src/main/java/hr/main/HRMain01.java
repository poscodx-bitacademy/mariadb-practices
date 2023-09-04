package hr.main;

import java.util.List;
import java.util.Scanner;

import hr.dao.dao.EmployeesDao;
import hr.dao.vo.EmployeesVo;

public class HRMain01 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		while(true) {
			System.out.print("이름>");
			String keyword = scanner.nextLine();
			if("quit".equals(keyword)) {
				break;
			}
			
			List<EmployeesVo> list = new EmployeesDao().findByName(keyword);
			
			for(EmployeesVo vo : list) {
				System.out.println(vo.getEmpNo() + ":" + vo.getFirstName() + ":" + vo.getLastName());
			}
		}
		
		scanner.close();
	}

}
