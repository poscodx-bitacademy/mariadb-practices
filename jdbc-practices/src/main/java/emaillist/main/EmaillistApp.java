package emaillist.main;

import java.util.List;
import java.util.Scanner;

import emaillist.dao.EmaillistDao;
import emaillist.vo.EmaillistVo;

public class EmaillistApp {
	private static Scanner scanner = new Scanner(System.in);
	
	public static void main(String[] args) {
		while(true) {
			System.out.print("(l)ist (i)nsert (d)elete (q)uit > ");
			String command = scanner.nextLine();
			
			if("l".equals(command)) {
				doList();
			} else if("i".equals(command)) {
				doInsert();
			} else if("d".equals(command)) {
				doDelete();
			} else if("q".equals(command)) {
				scanner.close();
				break;
			}
		}
	}

	private static void doDelete() {
		System.out.print("이메일:");
		String email = scanner.nextLine();
		new EmaillistDao().deleteByEmail(email);

		doList();
	}

	private static void doInsert() {
		System.out.print("성:");
		String firstName = scanner.nextLine();
		
		System.out.print("이름:");
		String lastName = scanner.nextLine();
		
		System.out.print("이메일:");
		String email = scanner.nextLine();
		
		EmaillistVo vo = new EmaillistVo();
		vo.setFirstName(firstName);
		vo.setLastName(lastName);
		vo.setEmail(email);
		
		new EmaillistDao().insert(vo);

		doList();
	}

	private static void doList() {
		List<EmaillistVo> list = new EmaillistDao().findAll();
		for(EmaillistVo vo : list) {
			System.out.println("이름:" + vo.getFirstName() + vo.getLastName() + ", 이메일:" + vo.getEmail());
		}
	}
}
