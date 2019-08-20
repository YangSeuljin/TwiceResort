package option;

public class Option {


	public static String roomoption(int introom) {

		String roomname = null;
		switch(introom){

		case 1 : roomname="모찌모찌 룸";
		break;
		case 2 : roomname="쯔뭉 룸";
		break;
		case 3 : roomname="나부기 룸";
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
