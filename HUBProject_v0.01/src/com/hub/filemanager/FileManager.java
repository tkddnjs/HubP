package com.hub.filemanager;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class FileManager {

	private static final int IMG_WIDTH = 128;
	private static final int IMG_HEIGHT = 128;

	public void resizeFile(String filePath, String fileType) {
		
		try {
			File file = new File(filePath);
			BufferedImage originalImage = ImageIO.read(file);
			int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
			
			BufferedImage resizeImage = resizeImage(originalImage, type);
			switch(fileType){
				case "jpg": 
					ImageIO.write(resizeImage, "jpg", new File(filePath));
					break;
				case "png":
					ImageIO.write(resizeImage, "png", new File(filePath));
					break;
				case "gif":
					ImageIO.write(resizeImage, "gif", new File(filePath));
					break;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private BufferedImage resizeImage(BufferedImage originalImage, int type) {
		BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
		g.dispose();
		
		return resizedImage;
	}
}
