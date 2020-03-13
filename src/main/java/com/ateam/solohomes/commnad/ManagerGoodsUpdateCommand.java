package com.ateam.solohomes.commnad;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.GoodsDTO;
import com.ateam.solohomes.beans.GoodsInfoDTO;
import com.ateam.solohomes.beans.manager.ManagerDAO;

public class ManagerGoodsUpdateCommand implements Command {

	private static final String SAVE_PATH = "C:\\tomcat\\apache-tomcat-8.5.49-ateam\\wtpwebapps\\solohomes\\img\\goods";
	@Override
	public void execute(final Model model) {
		
		C.transactionTemplate.execute(new TransactionCallbackWithoutResult() {
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {
				MultipartHttpServletRequest request = (MultipartHttpServletRequest)model.getAttribute("request");
				
				// get request data;
				MultipartFile gImg = request.getFile("g_img");
				String[] inColors = request.getParameterValues("in_color");
				List<MultipartFile> inImgs = request.getFiles("in_img");
				
				// get orignal
				Map<String, Object> map = model.asMap();
				int g_uid = (Integer)(map.get("g_uid"));
				GoodsDTO originalGoods = (GoodsDTO)map.get("goods");
				@SuppressWarnings("unchecked")
				ArrayList<GoodsInfoDTO> originalInfoList = (ArrayList<GoodsInfoDTO>)map.get("inList");
				
				
				// GoodsDTO setting
				GoodsDTO dto = new GoodsDTO();
				dto.setG_type(Integer.parseInt(request.getParameter("g_type")));
				dto.setG_name(request.getParameter("g_name"));
				if (request.getParameter("g_size") != null) {
					dto.setG_size(request.getParameter("g_size"));
				} else {
					dto.setG_size("");
				}
				dto.setG_price(Integer.parseInt(request.getParameter("g_price")));
				
				int countInfo = inImgs.size();
				String[] inImgsPaths = new String[countInfo];
				for (int i = 0; i < countInfo; i++) {
					inImgsPaths[i] = uploadFile(inImgs.get(i));
				}
				String gImgPath = uploadFile(gImg);
				dto.setG_img(gImgPath);
				
				
				// do transaction
				try {
					ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
					
					dao.updateGoods(dto, g_uid);
					int result = 0;
					for (int i = 0; i < originalInfoList.size(); i++) {
						dao.deleteGoodsInfoByUid(originalInfoList.get(i).getIn_uid());
					}
					for (int i = 0; i < countInfo; i++) {
						result += dao.insertGoodsInfo(inColors[i], inImgsPaths[i], g_uid);
					}
					model.addAttribute("result", result);
					
					//model.addAttribute("test", inImgsPaths[0]);
				} catch(Exception e) {
					// 트랜잭션 오류 발생시 파일 삭제
					File file = new File(gImgPath);
					if (file.exists()) file.delete();

					for (int i = 0; i < countInfo; i++) {
						file = new File(inImgsPaths[i]);
						if (file.exists()) file.delete();
						System.out.println("파일삭제");
					}
					status.setRollbackOnly();
					e.printStackTrace();
					model.addAttribute("result", 0);
				} finally {
					// 원래 파일 삭제
					File file = new File(SAVE_PATH + "/" + originalGoods.getG_img());
					if (file.exists()) file.delete();
					
					for (int i = 0; i < originalInfoList.size(); i++) {
						file = new File(SAVE_PATH + "/" + originalInfoList.get(i).getIn_img());
						if (file.exists()) file.delete();
					}
				}
			}
		});
		
	}
	
	public String uploadFile(MultipartFile img) {
		UUID saveName = UUID.randomUUID();
		String orignalName = img.getOriginalFilename();
		String ext = orignalName.substring(orignalName.lastIndexOf("."), orignalName.length());
		String dataName = saveName.toString().substring(0, 10) + ext;
		String realPath = SAVE_PATH + "/" + dataName;
		
		try {
			byte[] data = img.getBytes();
			FileOutputStream fos = new FileOutputStream(realPath);
			fos.write(data);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return dataName;
	}
}
