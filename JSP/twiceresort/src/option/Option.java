package option;

public class Option {


	public static String roomoption(int introom) {

		String roomname = null;
		switch(introom){

		case 1 : roomname="VIP룸";
		break;
		case 2 : roomname="일반룸";
		break;
		case 3 : roomname="합리적인룸";
		break;

		}
		return roomname;

	}
	
	public static String changename(String name) {
		String arrayStr[]=name.split(",");
		
		String name1=arrayStr[0];
		String cutname=name1.substring(13);
		if(cutname.length()<3){
			name=cutname.substring(0,1);
			
		}
		
		if(cutname.length()>=3){
			name=cutname.substring(0,2);
			
		}
		return name+"*";
		}
	
	public static String name(String name) {
		String arrayStr[]=name.split(",");
		
		String name1=arrayStr[0];
		String cutname=name1.substring(13);
		
		return cutname;
		}
	
}
