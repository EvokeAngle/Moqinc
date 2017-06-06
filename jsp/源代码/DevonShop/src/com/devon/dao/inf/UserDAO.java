package com.devon.dao.inf;


import java.util.List;

import org.dom4j.Document;

import com.devon.dao.dto.User;

public interface UserDAO {
	public int[] getResult(User user, int userType, int queryMode, int pageNum);
	
	public Document getDocumentFromXML();
	
	public void writeDocumentIntoXML(Document document);
	
	public boolean insertUser(User user, int userType);
	
	public boolean deleteUser(String userName, int userType);
	
	public boolean updateUser(User user, int userType);
	
	public List<User> selectUser(User user, int userType, int queryMode, int pageNum);
	
	public void updateLoginInfo (String suser,String dlastDate);
}
