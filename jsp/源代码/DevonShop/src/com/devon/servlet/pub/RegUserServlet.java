package com.devon.servlet.pub;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;

import com.devon.dao.dto.User;
import com.devon.dao.impl.UserDAOImpl;
import com.devon.util.CurrentTimeFactory;

public class RegUserServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// �������ע��/�޸�����ҳ��ע��/�޸���Ϣ
		String type = req.getParameter("type");
		String task = req.getParameter("task");
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String sex = req.getParameter("sex");
		String realName = req.getParameter("realName");
		String birthday = req.getParameter("birthday");
		String email = req.getParameter("email");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String post = req.getParameter("post");

		// ע��ʱ��,�������,����¼ʱ��
		User user = new User();
		// ��װ�û���Ϣ
		user.setUserName(userName);
		user.setPassword(password);
		user.setSex(sex);
		user.setRealName(realName);
		user.setBirthday(birthday);
		user.setEmail(email);
		user.setTel(tel);
		user.setAddress(address);
		user.setPost(post);
		user.setType(type);

		// ����Ա
		if("1".equals(type) || "0".equals(type)){
			// insert
			if("insert".equals(task)){
				
				String dregDate = CurrentTimeFactory.getCurrentTime(CurrentTimeFactory.FORMAT_TIME);
				user.setRegTime(dregDate);
				user.setLastLogin(dregDate);
				user.setLoginTotal("1");
				UserDAOImpl.getInstance().insertUser(user, UserDAOImpl.USER_OF_ADMIN);
				
				// ��ǰ��¼�߼���Ϊ0�������ͨ����Աʱ,��ת...
				if("1".equals(type) && "0".equals(((User)req.getSession().getAttribute("adminUser")).getType())){
					req.getRequestDispatcher("/admin/manage/tab/QueryUserServlet?queryType=commonUser").forward(req, resp);
					return;
				}
				
			// update
			}else if("update".equals(task)){
				
				UserDAOImpl.getInstance().updateUser(user, UserDAOImpl.USER_OF_ADMIN);
				// ��ǰ��¼�߼���Ϊ0�������ͨ����Աʱ,��ת...
				if("1".equals(type) && "0".equals(((User)req.getSession().getAttribute("adminUser")).getType())){
					req.getRequestDispatcher("/admin/manage/tab/QueryUserServlet?queryType=commonUser").forward(req, resp);
					return;
				}
				resp.sendRedirect(getServletContext().getContextPath() + "/image/updsuccess.jpg");
			}



		// ��ͨ�û�
		}else if("2".equals(type)){
			// insert
			if("insert".equals(task)){
				
				String dregDate = CurrentTimeFactory.getCurrentTime(CurrentTimeFactory.FORMAT_TIME);
				user.setRegTime(dregDate);
				user.setLastLogin(dregDate);
				user.setLoginTotal("1");
				
				UserDAOImpl.getInstance().insertUser(user, UserDAOImpl.USER_OF_COMMON);
				req.getSession().setAttribute("commonUser", user);
				resp.getWriter().write("<script>alert('��ϲ����ע��ɹ������ȷ����ϵͳ���Զ�Ϊ����¼��');window.location.href='" + getServletContext().getContextPath() + "/common/index.jsp'</script>");
			// update
			}else if("update".equals(task)){
				UserDAOImpl.getInstance().updateUser(user, UserDAOImpl.USER_OF_COMMON);
			}
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String userName = req.getParameter("userName");
		String isFreeze = req.getParameter("isFreeze");
		String pageNum = req.getParameter("pageNum");
		
		User user = new User();
		user.setUserName(userName);
		user.setIsFreeze(isFreeze);

		UserDAOImpl.getInstance().updateUser(user, UserDAOImpl.USER_OF_COMMON);
		// ����/�ⶳʱ,��ת...
		
		resp.sendRedirect(getServletContext().getContextPath() + "/admin/manage/tab/QueryUserServlet?queryType=commonUser&pageNum=" + pageNum);
		
	}
	
}
