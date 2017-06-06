package com.devon.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.FileTypeMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import com.devon.dao.dto.Mc;
import com.devon.dao.impl.McDAOImpl;
import com.devon.util.FileNameFactory;

public class InsUpdGoodsServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		DiskFileUpload dfu = new DiskFileUpload();
		Map<String,String> goodsData = new HashMap<String,String>();
		try {
			List<FileItem> fileItems = dfu.parseRequest(request);
			for (FileItem fileItem : fileItems) {
				// 为普通表单元素
				if(fileItem.isFormField()){
					goodsData.put(fileItem.getFieldName(), fileItem.getString());
				// 文件表单元素
				}else{
					// 文件不为空时
					 if(fileItem.getName() != null && !fileItem.getName().equals("") && fileItem.getSize() != 0){
						 String randomFileName = FileNameFactory.createRandomFileName(fileItem.getName());
						 goodsData.put(fileItem.getFieldName(), "upload/"+randomFileName);
						 String localPath = getServletContext().getRealPath("/upload/" + randomFileName);
						 fileItem.write(new File(localPath));
					// 文件为空时
					 }else{
						 String ff = fileItem.getFieldName();
						 String fd = fileItems.get(2).getString();
						 goodsData.put(fileItem.getFieldName(), fileItems.get(2).getString());
					 }
				}
			}
			String task = goodsData.get("task");
			// 封装商品信息
			Mc mc = new Mc();
			mc.setNid(goodsData.get("nid"));
			mc.setSname(goodsData.get("sname"));
			mc.setSdescription(goodsData.get("sdescription"));
			mc.setNprice(goodsData.get("nprice"));
			mc.setSimg(goodsData.get("simg"));
			mc.setSmcTag(goodsData.get("smcTag"));
			mc.setDcDate(goodsData.get("dcDate"));
			mc.setNmaxId(goodsData.get("nmaxId"));
			mc.setNminId(goodsData.get("nminId"));
			// 修改商品信息
			if("update".equals(task)){
				McDAOImpl.getInstance().updateMc(mc);

			// 增加商品
			}else if("insert".equals(task)){
				McDAOImpl.getInstance().insertMc(mc);
			}
			// 操作完成后转到显示所有商品信息页面
			response.sendRedirect(getServletContext().getContextPath() + "/admin/manage/tab/QueryGoodsServlet?page=tab");
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
