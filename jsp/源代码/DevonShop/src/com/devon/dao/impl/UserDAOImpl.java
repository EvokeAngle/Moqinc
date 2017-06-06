package com.devon.dao.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import com.devon.dao.db.ConnOracle;
import com.devon.dao.dto.User;
import com.devon.dao.inf.UserDAO;
import com.devon.util.DatabaseConnecter;

public class UserDAOImpl implements UserDAO{
	
	//private static String xmlFilePath = "D:/workspace_MyEclipse/DevonShop/WebRoot/user.xml";
	//private static String xmlFilePath = "E:/jn100508/DevonShop/WebRoot/user.xml";
	private static String xmlFilePath;
	public static final int USER_OF_COMMON = 0;
	public static final int USER_OF_ADMIN = 1;
	public static final int QUERY_FOR_VAGUE = 2;
	public static final int QUERY_FOR_EXACT = 3;

	public static final int PAGESIZE = 10;
	private static UserDAOImpl userDAOImpl = new UserDAOImpl();
	
	private UserDAOImpl(){
		
	}

	public static void initXMLFilePath(String xmlFilePath){
		UserDAOImpl.xmlFilePath = xmlFilePath;
	}
	
	public static UserDAOImpl getInstance(){
		return userDAOImpl;
	}
	
	public int[] getResult(User user, int userType, int queryMode, int pageNum){
		List<User> userList = selectUser(user, userType, queryMode, 0);
		int recordTotal = userList.size();
		int pageTotal = 0;
		if(recordTotal == 0){
			pageTotal = 0;
		}else{
			pageTotal = (recordTotal - 1)/PAGESIZE + 1;
		}
		return new int[]{recordTotal, pageTotal};
	}
	
	public Document getDocumentFromXML(){
		SAXReader saxReader = new SAXReader();
		Document document = null;
		try {
			document = saxReader.read(new File(xmlFilePath));
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return document;
	}
	
	public void writeDocumentIntoXML(Document document){
		OutputFormat outputFormat = OutputFormat.createPrettyPrint();
		outputFormat.setEncoding("GBK");
		XMLWriter xmlWriter = null;
		try {
			xmlWriter = new XMLWriter(new FileOutputStream(xmlFilePath), outputFormat);
			xmlWriter.write(document);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(xmlWriter != null){
				try {
					xmlWriter.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public boolean insertUser(User user, int userType){
		boolean isSuccess = true;
		// 判断是否存在相同用户名----------------------------------------------------------------------------------------------------
		// 只需取出用户名进行判断要新增的用户是否存在
		User userTest = new User();
		userTest.setUserName(user.getUserName());
		// 从XML中查找是否有此用户存在
		List<User> resultAdmin = selectUser(userTest, UserDAOImpl.USER_OF_ADMIN, UserDAOImpl.QUERY_FOR_EXACT, 0);
		if(resultAdmin.size() != 0){
			return false;
		}
		// 从数据库中查找是否有此用户存在
		List<User> resultDb = selectUser(userTest, UserDAOImpl.USER_OF_COMMON, UserDAOImpl.QUERY_FOR_EXACT, 0);
		if(resultDb.size() != 0){
			return false;
		}
		// 不存在相同用户名----------------------------------------------------------------------------------------------------
		// 普通用户
		if(userType == 0){

			Connection connection = ConnOracle.getConn();
			String sql = "insert into T_USER values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			//Connection connection = DatabaseConnecter.getConnect();
			try {
				PreparedStatement pStmt = connection.prepareStatement(sql);
				pStmt.setString(1, user.getUserName());
				pStmt.setString(2, user.getPassword());
				pStmt.setString(3, user.getRealName());
				pStmt.setString(4, user.getSex());
				pStmt.setString(5, user.getBirthday());
				pStmt.setString(6, user.getEmail());
				pStmt.setString(7, user.getTel());
				pStmt.setString(8, user.getAddress());
				pStmt.setString(9, user.getPost());
				pStmt.setString(10, user.getType());
				pStmt.setString(11, user.getRegTime());
				pStmt.setString(12, user.getIsFreeze());
				pStmt.setString(13, user.getLastLogin());
				pStmt.setString(14, user.getLoginTotal());
				pStmt.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return isSuccess;
		// 管理员
		}else if(userType == 1){
			Document document = getDocumentFromXML();
			Element root = document.getRootElement();
			Element elementUser = root.addElement("user");
			elementUser.addAttribute("id", user.getUserName());
			elementUser.addAttribute("pwd", user.getPassword());
			
			Element elementUserNeme = elementUser.addElement("username");
			elementUserNeme.addText(user.getUserName());
			Element elementPassword = elementUser.addElement("password");
			elementPassword.addText(user.getPassword());
			Element elementRealName = elementUser.addElement("realname");
			elementRealName.addText(user.getRealName());
			Element elementSex = elementUser.addElement("sex");
			elementSex.addText(user.getSex());
			Element elementBirthday = elementUser.addElement("birthday");
			elementBirthday.addText(user.getBirthday());
			Element elementEmail = elementUser.addElement("email");
			elementEmail.addText(user.getEmail());
			Element elementTel = elementUser.addElement("tel");
			elementTel.addText(user.getTel());
			Element elementAddress = elementUser.addElement("address");
			elementAddress.addText(user.getAddress());
			Element elementPost = elementUser.addElement("post");
			elementPost.addText(user.getPost());
			Element elementType = elementUser.addElement("type");
			elementType.addText(user.getType());
			Element elementRegTime = elementUser.addElement("regtime");
			elementRegTime.addText(user.getRegTime());
			
			writeDocumentIntoXML(document);
		}

		return isSuccess;
	}
	
	public boolean deleteUser(String userName, int userType){

		boolean isSuccess = true;
		if(userType == 0){

			Connection connection = ConnOracle.getConn();
			//Connection connection = DatabaseConnecter.getConnect();
			String sql = "delete from T_USER where username = ?";
			PreparedStatement pStmt = null;
			try {
				pStmt = connection.prepareStatement(sql);
				pStmt.setString(1, userName);
				isSuccess = pStmt.execute();
			} catch (SQLException e) {
				e.printStackTrace();
				isSuccess = false;
			}finally{
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}else if(userType == 1){
			Document document = getDocumentFromXML();
			Element elementUser = (Element)document.selectSingleNode("/users/user[@id='" + userName + "']");
			Element root = document.getRootElement();
			root.remove(elementUser);
			writeDocumentIntoXML(document);
		}

		return isSuccess;
	}
	
	public boolean updateUser(User user, int userType){
		boolean isSuccess = true;
		// 普通用户
		if(userType == 0){

			Connection connection = ConnOracle.getConn();
			//Connection connection = DatabaseConnecter.getConnect();
			// 修改基本资料
			if(user.getPassword() == null){
				String sql = null;
				// 修改基本资料
				if(user.getIsFreeze() == null){
					sql = 
					"update T_USER set sname = ?, ssex = ?, sbirthday = ?, semail = ?, sphone = ?, saddress = ?, scode = ? where suser = '" + user.getUserName() + "'";
					try {
						PreparedStatement pStmt = connection.prepareStatement(sql);
						pStmt.setString(1, user.getRealName());
						pStmt.setString(2, user.getSex());
						pStmt.setString(3, user.getBirthday());
						pStmt.setString(4, user.getEmail());
						pStmt.setString(5, user.getTel());
						pStmt.setString(6, user.getAddress());
						pStmt.setString(7, user.getPost());
						isSuccess = pStmt.execute();
					} catch (SQLException e) {
						e.printStackTrace();
					}finally{
						try {
							connection.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				// 冻结或解冻用户
				}else{
					sql = "update T_USER set slock = ? where suser ='" + user.getUserName() + "'";
					try {
						PreparedStatement pStmt = connection.prepareStatement(sql);
						pStmt.setString(1, user.getIsFreeze());
						isSuccess = pStmt.execute();
					} catch (SQLException e) {
						e.printStackTrace();
					}finally{
						try {
							connection.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
				
			// 修改密码
			}else if(user.getPassword() != null){
				String sql = "update T_USER set spwd = ? where suser = '" + user.getUserName() + "'";
					try {
						PreparedStatement pStmt = connection.prepareStatement(sql);
						pStmt.setString(1, user.getPassword());
						isSuccess = pStmt.execute();
					} catch (SQLException e) {
						e.printStackTrace();
					}finally{
						try {
							connection.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
			}
		// 管理员
		}else if(userType == 1){
			Document document = getDocumentFromXML();
			Element elementUser = (Element)document.selectSingleNode("/users/user[@id='" + user.getUserName() + "']");
			
			// 修改资料
			if(user.getPassword() == null){
				elementUser.element("realname").setText(user.getRealName());
				elementUser.element("sex").setText(user.getSex());
				elementUser.element("birthday").setText(user.getBirthday());
				elementUser.element("email").setText(user.getEmail());
				elementUser.element("tel").setText(user.getTel());
				elementUser.element("address").setText(user.getAddress());
				elementUser.element("post").setText(user.getPost());
			// 修改密码
			}else if(user.getPassword() != null){
				elementUser.setAttributeValue("pwd", user.getPassword());
				elementUser.element("password").setText(user.getPassword());
			}

			writeDocumentIntoXML(document);
		}

		return isSuccess;
	}
	
	public List<User> selectUser(User user, int userType, int queryMode, int pageNum){
		List<User> users = new LinkedList<User>();
		ResultSet resultSet = null;
		// 普通用户--------------------------------------------------------------------------------------------------------------
		if(userType == 0){

			Connection connection = ConnOracle.getConn();
			//Connection connection = DatabaseConnecter.getConnect();
			// 查询所有用户
			if(user == null){
				String sql = "select SUSER,SPWD,SNAME,SSEX,SBIRTHDAY,SEMAIL,SPHONE,SADDRESS,SCODE,NLEVEL,DREGDATE,SLOCK,DLASTDATE,NLOGIN,rownum rn from T_USER";
				// !=0 按页取数据
				if(pageNum != 0){
					int begin = (pageNum - 1) * PAGESIZE + 1;
					int end = PAGESIZE * pageNum;

					sql = "select * from (" + sql + " where rownum<= " + end + ") where rn>=" + begin;
				}
				try {
					PreparedStatement pStmt = connection.prepareStatement(sql);
					resultSet = pStmt.executeQuery();
					while(resultSet.next()){
						User temp = new User();
						temp.setUserName(resultSet.getString("suser"));
						temp.setRealName(resultSet.getString("sname"));
						temp.setSex(resultSet.getString("ssex"));
						temp.setBirthday(resultSet.getString("sbirthday"));
						temp.setTel(resultSet.getString("sphone"));
						temp.setAddress(resultSet.getString("saddress"));
						temp.setEmail(resultSet.getString("semail"));
						temp.setPost(resultSet.getString("scode"));
						String dregDate = resultSet.getString("dregdate");
						if(dregDate != null && !"".equals(dregDate)){
							dregDate = dregDate.substring(0, 19);
						}
						temp.setRegTime(dregDate);
						temp.setIsFreeze(resultSet.getString("slock"));
						temp.setType(resultSet.getString("nlevel"));
						users.add(temp);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}finally{
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			// 条件查询
			}else if(user != null){
				String userName = user.getUserName();
				String password = user.getPassword();
				String sex = user.getSex();
				String isFreeze = user.getIsFreeze();
				String sql = null;
				// 模糊查询
				if(queryMode == 2){
					sql = "select SUSER,SPWD,SNAME,SSEX,SBIRTHDAY,SEMAIL,SPHONE,SADDRESS,SCODE,NLEVEL,DREGDATE,SLOCK,DLASTDATE,NLOGIN,rownum rn from T_USER where 1=1";
					if(userName != null && !"".equals(userName)){
						sql = sql + " and suser in '" + userName + "'";
					}
					if(sex != null && !"全部".equals(sex) && !"".equals(sex)){
						sql = sql + " and ssex = '" + sex + "'";
					}
					if(isFreeze != null && !"全部".equals(isFreeze) && !"".equals(isFreeze)){
						sql = sql + " and slock = '" + isFreeze + "'";
					}
					
				// 精确查询(登录证验)
				}else if(queryMode == 3){
					sql = "select SUSER,SPWD,SNAME,SSEX,SBIRTHDAY,SEMAIL,SPHONE,SADDRESS,SCODE,NLEVEL,DREGDATE,SLOCK,DLASTDATE,NLOGIN,rownum rn from T_USER where 1=1";
					if(userName != null && !"".equals(userName)){
						sql = sql + " and suser = '" + userName + "'";
					}
					if(password != null && !"".equals(password)){
						sql = sql + " and spwd = '" + password + "'";
					}
				}
				
				// !=0 按页取数据
				if(pageNum != 0){
					int begin = (pageNum - 1) * PAGESIZE + 1;
					int end = PAGESIZE * pageNum;

					sql = "select * from (" + sql + " and rownum<= " + end + ") where rn>=" + begin;
				}

				try {
					PreparedStatement pStmt = connection.prepareStatement(sql);
					resultSet = pStmt.executeQuery();
					while(resultSet.next()){
						User temp = new User();
						temp.setUserName(resultSet.getString("suser"));
						temp.setRealName(resultSet.getString("sname"));
						temp.setSex(resultSet.getString("ssex"));
						temp.setBirthday(resultSet.getString("sbirthday"));
						temp.setTel(resultSet.getString("sphone"));
						temp.setAddress(resultSet.getString("saddress"));
						temp.setEmail(resultSet.getString("semail"));
						temp.setPost(resultSet.getString("scode"));
						String dregDate = resultSet.getString("dregdate");
						if(dregDate != null && !"".equals(dregDate)){
							dregDate = dregDate.substring(0, 19);
						}
						temp.setRegTime(dregDate);
						temp.setIsFreeze(resultSet.getString("slock"));
						temp.setType(resultSet.getString("nlevel"));
						users.add(temp);
					}
				}catch (SQLException e) {
					e.printStackTrace();
				}finally{
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
				
		// 管理员---------------------------------------------------------------------------------------------------------------
		}else if(userType == 1){
			Document document = getDocumentFromXML();
			// 查询所有管理员
			if(user == null){
				List<Element> elementUsers = document.selectNodes("/users/*");
				for (Element element : elementUsers) {
					User temp = new User();
					temp.setUserName(element.element("username").getText());
					temp.setRealName(element.element("realname").getText());
					temp.setSex(element.element("sex").getText());
					temp.setBirthday(element.element("birthday").getText());
					temp.setTel(element.element("tel").getText());
					temp.setAddress(element.element("address").getText());
					temp.setEmail(element.element("email").getText());
					temp.setPost(element.element("post").getText());
					temp.setRegTime(element.element("regtime").getText());
					temp.setType(element.element("type").getText());
					users.add(temp);
				}
			// 条件查询
			}else if(user != null){
				String userName = user.getUserName();
				String password = user.getPassword();
				String sex = user.getSex();
				String xPath = null;
				// 模糊查询
				if(queryMode == 2){
					if((userName != null && !"".equals(userName)) && (sex != null && !"全部".equals(sex))){
						xPath = "/users/user[contains(username,'" + userName + "') and contains(sex,'" + sex + "')]";
					}else if((userName != null && !"".equals(userName)) && (sex == null || "全部".equals(sex))){
						xPath = "/users/user[contains(username,'" + userName + "')]";
					}else if((userName == null || "".equals(userName)) && (sex != null && !"全部".equals(sex))){
						xPath = "/users/user[contains(sex,'" + sex + "')]";
					}
				// 精确查询
				}else if (queryMode == 3){
					// (修改资料)
					if(password == null){
						xPath = "/users/user[@id='" + userName + "']";
					// (登录验证)
					}else if(password != null){
						xPath = "/users/user[@id='" + userName + "' and @pwd='" + password + "']";
					}
					
				}
				
				List<Element> elementUsers = document.selectNodes(xPath);
				for (Element element : elementUsers) {
					User temp = new User();
					temp.setUserName(element.element("username").getText());
					temp.setRealName(element.element("realname").getText());
					temp.setSex(element.element("sex").getText());
					temp.setBirthday(element.element("birthday").getText());
					temp.setTel(element.element("tel").getText());
					temp.setAddress(element.element("address").getText());
					temp.setEmail(element.element("email").getText());
					temp.setPost(element.element("post").getText());
					temp.setRegTime(element.element("regtime").getText());
					temp.setType(element.element("type").getText());
					users.add(temp);
				}
			}
			// !=0 按页取数据
			if(pageNum != 0){
				int begin = (pageNum - 1) * PAGESIZE + 1;
				int end = PAGESIZE * pageNum;
				int[] res = getResult(user, userType, queryMode, pageNum);
				if(end > res[0]){
					end = res[0];
				}
				if(begin > res[0]){
					begin = (getResult(user, userType, queryMode, pageNum)[1] - 1) * PAGESIZE + 1;
				}
				users = users.subList(begin - 1, end);
			}
		}

		return users;
	}
	
	public void updateLoginInfo (String suser,String dlastDate){
		Connection connection = ConnOracle.getConn();
		String sql = "update t_user set dlastdate=?,nlogin=nlogin+1 where suser=?";
		PreparedStatement pStmt = null;
		try {
			pStmt = connection.prepareStatement(sql);
			pStmt.setString(1, dlastDate);
			pStmt.setString(2, suser);
			pStmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
}
