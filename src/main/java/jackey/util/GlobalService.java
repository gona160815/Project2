package main.java.jackey.util;

public class GlobalService {
	public static final int RECORDS_PER_PAGE = 5;
	public static final String SYSTEM_NAME = "BIKE";
	public static final int IMAGE_FILENAME_LENGTH = 20;
	public static final String JNDI_DB_NAME = "java:comp/env/jdbc/xe";
	public static final Integer MGRID = 1416;
	
	public String getSystemName() { // systemName  ${SYSTEM.systemName}
		return SYSTEM_NAME;
	}
}
