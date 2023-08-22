package day05;

// java beans의 조건
// 1) private 멤버 필드
// 2) public getter/ setter
// 3) 기본 생성자
// (오버로딩을 하려면 만들어야한다.)

// 자바빈스의 클래스를 만들줄 알아야하고.
// 멤버필드 변수이름과 파라미터의 이름이 같아야한다.

public class Member {

	private String name;
	private int age;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

}
