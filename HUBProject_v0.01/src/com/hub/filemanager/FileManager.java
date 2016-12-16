package com.hub.filemanager;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;

import org.apache.commons.io.IOUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileManager {

	private static final int IMG_WIDTH = 128;
	private static final int IMG_HEIGHT = 128;

	public String registerImage(String saveDir, MultipartFile image){
		OutputStream out = null;
		
		// input image의 크기, 이름
		int size = (int) image.getSize();
		String originalName = image.getOriginalFilename();
		
		// input image의 파일 형식
		int length = originalName.length();
		String fileType = originalName.substring(length-3, length);
		
		// 현재시간 -> 스트링
		DateFormat dataFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		
		// 업로드할 파일 이름 생성
		StringBuilder fileName = new StringBuilder();
		fileName.append(originalName.substring(0, length-4));
		fileName.append(dataFormat.format(date));
		fileName.append("." + fileType);
		
		String filePath = saveDir + "/" + fileName.toString();
		
		try {
			out = new FileOutputStream(filePath);
			BufferedInputStream bis = new BufferedInputStream(image.getInputStream());
			byte [] buffer = new byte[size];
			int read;
			while ((read = bis.read(buffer)) > 0){
				out.write(buffer, 0, read);
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			IOUtils.closeQuietly(out);
		}
		
		// 저장할 파일의 크기 재지정
		resizeFile(filePath, fileType);
		
		return fileName.toString();
	}
	
	
	
	public void resizeFile(String filePath, String fileType) {
		
		try {
			File file = new File(filePath);
			BufferedImage originalImage = ImageIO.read(file);
			//int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
			//BufferedImage resizeImage = resizeImage(originalImage, type);
			switch(fileType){
				case "jpg": 
					ImageIO.write(originalImage, "jpg", new File(filePath));
					break;
				case "png":
					ImageIO.write(originalImage, "png", new File(filePath));
					break;
				case "gif":
					ImageIO.write(originalImage, "gif", new File(filePath));
					break;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//	private BufferedImage resizeImage(BufferedImage originalImage, int type) {
//		BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
//		Graphics2D g = resizedImage.createGraphics();
//		g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
//		g.dispose();
//		
//		return resizedImage;
//	}
}
