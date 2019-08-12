package dto;

public class JoaDto {
	//DTO는 레코드 1개를 저장하는 클래스이다.

	private String resv_date;
	private String name;
	private String date;
	private String firstDate;
	private int room;
	private String addr;
	private int telnum;
	private String in_name;
	private String comment;
	private String write_date;
	private int processing;
	private int firstRoom;

	//toString
	@Override
	public String toString() {
		return "JoaDto [name=" + name + ", date=" + date + ", room=" + room + ", addr=" + addr +",telnum="+telnum+",in_name="+in_name+",comment="+comment+",write_date="+write_date+",processing="+ processing +"]";
	}
	//디폴트 생성자
	public JoaDto() {
		super();
	}

	//매개변수가 들어가는 생성자
	public JoaDto(String name, String date, int room, String addr,int telnum,
			String in_name, String comment, String write_date, int processing) {
		this();
		this.name = name;
		this.date = date;
		this.room = room;
		this.addr = addr;
		this.telnum= telnum;
		this.in_name=in_name;
		this.comment=comment;
		this.write_date=write_date;
		this.processing=processing;
		this.firstDate=firstDate;
		this.firstRoom=firstRoom;

	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getTelnum() {
		return telnum;
	}

	public void setTelnum(int telnum) {
		this.telnum = telnum;
	}

	public String getIn_name() {
		return in_name;
	}

	public void setIn_name(String in_name) {
		this.in_name = in_name;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public int getProcessing() {
		return processing;
	}

	public void setProcessing(int processing) {
		this.processing = processing;
	}
	public String getfirstDate() {
		return firstDate;
	}

	public void setfirstDate(String firstDate) {
		this.firstDate = firstDate;
	}
	public int getfirstRoom() {
		return firstRoom;
	}

	public void setfirstRoom(int firstRoom) {
		this.firstRoom = firstRoom;
	}



}
