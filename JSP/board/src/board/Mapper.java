package board;

public interface Mapper {
	public List<Test> testlist(@Param("pagenum") int pagenum, @Param("contentnum") int contentnum);
	public int testcount();

}
