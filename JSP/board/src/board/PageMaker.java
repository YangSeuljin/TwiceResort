package board;

public class PageMaker {
	//페이징을 위한 변수 선언
		private int totalcount; // 전체 게시물의 개수
		private int pagenum; // 현재 페이지 번호
		private int contentnum =10; // 한 페이지에 몇 개를 표시할지
		private int startpage = 1; // 현재 페이지 블록의 시작 페이지
		private int endpage =5; // 현재 페이지 블록의 마지막 페이지
		private boolean prev =false; // 이전 페이지로 가는 화살표
		private boolean next; // 다음 페이지로 가는 화살표
		private int currentblock=20;// 현재 페이지 블록
		private int lastblock;   	// 마지막 페이지 블록
		
		public void prevnext(int pagenum) {
			if(pagenum>0) {
				setPrev(false);
				setNext(true);
			}
			else if(getLastblock() == getCurrentblock()) {
				setPrev(true);
				setNext(false);
			}
			else {
				setPrev(true);
				setNext(true);
			}
			
		}
		
		
		public int calcpage(int totalcount,int contentnum) { // 전체 페이지 수를 계산하는 함수
			// 125 / 10 => 12.5
			// 13페이지
			//50 / 10 => 5
			//5페이지
			int totalpage = totalcount / contentnum;
			if(totalcount%contentnum>0) {
				totalpage++;
			}
			return totalpage;
		}
		
		public int getTotalcount() { // 전체 게시물의 개수
			return totalcount;
		}
		public void setTotalcount(int totalcount) { // 전체 게시물의 개수
			this.totalcount = totalcount;
		}
		public int getPagenum() {
			return pagenum;
		}
		public void setPagenum(int pagenum) {
			this.pagenum = pagenum;
		}
		public int getContentnum() {
			return contentnum;
		}
		public void setContentnum(int contentnum) { // 한 페이지에 몇 개를 표시할지
			this.contentnum = contentnum;
		}
		public int getStartpage() {
			return startpage;
		}
		public void setStartpage(int currentblock) {
			this.startpage = (currentblock*5)-4;
			// 1 2 3 4 5  현재 블록이 1이면 1*5 -4를 한 값이 첫 번째 페이지
			// 6 7 8 9 10 현재 블록이 2이면 2*5 -4를 한 값이 첫 번째 페이지
			// 11 12 13 현재 블록이 1이면 1*5 -4를 한 값이 첫 번째 페이지
		}
		public int getEndpage() {
			return endpage;
		}
		public void setEndpage(int getlastblock,int getcurrentblock) {
			if(getlastblock == getcurrentblock) { //마지막 블록이라면 마지막 페이지는 전체 페이지 수가 된다.
				this.endpage = calcpage(getTotalcount(), getContentnum());
			}
			else {
				this.endpage = getStartpage()+4;
			}
		}
		public boolean isPrev() {
			return prev;
		}
		public void setPrev(boolean prev) {
			this.prev = prev;
		}
		public boolean isNext() {
			return next;
		}
		public void setNext(boolean next) {
			this.next = next;
		}
		public int getCurrentblock() {
			return currentblock;
		}
		public void setCurrentblock(int pagenum) {
			//페이지 번호를 통해서 구한다.
			// 페이지 번호 / 페이지 그룹 안의 페이지 개수
			// 1p 1 /5 => 0.2 0 + 1 1=> 페이지 블록 1
			// 3p 3/5 => 0.xx +1 1=>페이지 블록 1
			
			this.currentblock = pagenum/5;
			if (pagenum%5>0) {
				this.currentblock++;
			}
		}
		public int getLastblock() {
			return lastblock;
		}
		public void setLastblock(int totalcount) {
			// 10 , 5 => 10* 5 => 50
			// 125 / 50
			//3
			this.lastblock = totalcount / (5*this.contentnum);
			if(totalcount %(5*this.contentnum)>0) {
				this.lastblock++;
			}
		}
		
		
		
		
		
		
		
}
