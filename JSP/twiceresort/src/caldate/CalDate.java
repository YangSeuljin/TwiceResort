package caldate;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CalDate {
	
	//오늘의 날짜를 구하는 메서드
	public String caldate(){
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new java.util.Date());
		return date;
	}
		
	// 특정한 날짜를 구하기 위한 메서드
	public static String addDate(String dt, int y, int m, int d) throws ParseException {
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
			String todaydate = sdf.format(new java.util.Date());
		
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	 
	        Calendar cal = Calendar.getInstance();
	        Date date = format.parse(dt);
	        cal.setTime(date);
	        cal.add(Calendar.YEAR, y);      //년 더하기
	        cal.add(Calendar.MONTH, 1);     //년 더하기
	        cal.add(Calendar.DATE, d);      //년 더하기
	 
	        return format.format(cal.getTime());

	
	}

}
