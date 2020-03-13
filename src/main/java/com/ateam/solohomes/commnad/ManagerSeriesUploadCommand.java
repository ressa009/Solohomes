package com.ateam.solohomes.commnad;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.GoodsDTO;
import com.ateam.solohomes.beans.SeriesDTO;
import com.ateam.solohomes.beans.manager.ManagerDAO;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

public class ManagerSeriesUploadCommand implements Command{
	
	private static final String SAVE_PATH = "C:\\tomcat\\apache-tomcat-8.5.49-ateam\\wtpwebapps\\solohomes\\img\\goods";

	@Override
	public void execute(final Model model) {
		
		C.transactionTemplate.execute(new TransactionCallbackWithoutResult() {
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {
				MultipartHttpServletRequest request = (MultipartHttpServletRequest)model.getAttribute("request");
				
				// get request data;
				MultipartFile srImg = request.getFile("sr_img");
				String sr_name = request.getParameter("sr_name");
				
				String[] g_uids_tmp = request.getParameterValues("uid");
				
				System.out.println(Arrays.toString(g_uids_tmp));
				
				int[] g_uids = new int[g_uids_tmp.length];
				for (int i = 0; i < g_uids.length; i++) {
					g_uids[i] = Integer.parseInt(g_uids_tmp[i]);
				}
				
				String sr_img = uploadFile(srImg);
				
				SeriesDTO dto = new SeriesDTO();
				dto.setSr_img(sr_img);
				dto.setSr_subject(sr_name);
				
				// do transaction
				try {
					int result = 0;
					
					ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
					result += dao.insertSeries(dto);
					int sr_uid = dto.getSr_uid();

					result += dao.insertSeiresGoods(sr_uid, g_uids);
					
					model.addAttribute("result", result);
					
					//model.addAttribute("test", inImgsPaths[0]);
				} catch(Exception e) {
					// 트랜잭션 오류 발생시 파일 삭제
					File file = new File(sr_img);
					if (file.exists()) file.delete();

					status.setRollbackOnly();
					e.printStackTrace();
					model.addAttribute("result", 0);
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
