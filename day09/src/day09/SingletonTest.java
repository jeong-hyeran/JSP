package day09;

public class SingletonTest {

	// singleton : 해당 클래스의 객체는 항상 하나만 존재하는 형태의 디자인 패턴
	///  똑같은 기능을 하는 객체를 중복으로 만들수 없게하므로 메모리를 아낄 수 있다.
	
	// 1 ) 생성자 호출을 허용하면 생성자를 호출할 때 마다 새로운 객체를 생성한다.
	// => 외부에서 생성자를 호출할 수 없도록 private 접근 제한자를 적용한다.
	private SingletonTest() {
		
	}
	
	// 2 ) 생성자를 막았기 때문에 객체를 통해서 메서드를 호출할 수 없다.
	// => 객체 없이 클래스로 접근 가능한 static 메서드를 작성한다.
	public static SingletonTest getInstance() {
		if(instance == null) {
			instance = new SingletonTest(); // 내부에서 private 참조 가능
		}
		return instance;
	}
	
	/// usebean으로 불러올 수 없다.
	
	// 3 ) static 메서드에서 객체를 반환하려면 static 필드를 참조해야한다.
	// => 자신과 동일한 클래스의 객체 하나를 저장할 수 있는 static 필드를 작성한다.
	private static SingletonTest instance;
}
