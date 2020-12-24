package main.java.jackey;

import java.io.IOException;


public class test {

	public static void main(String[] args) throws IOException {
//		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
//		String today = sdf.format(new Date());
//		Calendar calendar=Calendar.getInstance();
////		lastCalendar.set(Calendar.YEAR, year);
////		lastCalendar.set(Calendar.MONTH, month);
////		lastCalendar.set(Calendar.DATE, date);
//		calendar.add(Calendar.DATE, -7);
//		Date lastDate = calendar.getTime();
//		SimpleDateFormat lastSdf= new SimpleDateFormat("yyyy-MM-dd");
//		String lastSeven = lastSdf.format(lastDate);
//		System.out.println(today);
//		System.out.println(lastSeven);

//		Calendar calendar = Calendar.getInstance();
//		List<String> list = new ArrayList<String>();
//		for (int i = 0; i <= 11; i++) {
//			calendar.set(Calendar.MONTH, 0);
//			calendar.set(Calendar.DATE, 1);
//			calendar.add(Calendar.MONTH, i);
//			Date monthlyDate = calendar.getTime();
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			String month = sdf.format(monthlyDate);
//			list.add(month);
//		}
//		Calendar calendar = Calendar.getInstance();
//		calendar.set(Calendar.MONTH, 0);
//		calendar.set(Calendar.DATE, 1);
//		Date date = calendar.getTime();
//		SimpleDateFormat lastSdf = new SimpleDateFormat("yyyy-MM-dd");
//		String today = lastSdf.format(date);
//		System.out.println("aaa");
//		System.out.println(today);

//		Integer startEvent = 6853;
//		Integer endEvent = 8271;
//		Calendar calendar = Calendar.getInstance();
//		for (int i = 0; i < 11; i++) {
//			calendar.set(Calendar.MONTH, i);
//			for (int j = 1; j < 31; j++) {
//				calendar.set(Calendar.DATE, j);
//				Date date = calendar.getTime();
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//				String day = sdf.format(date);
//				for (int k = startEvent; k <= endEvent; k++) {
//					Long randomNumsCom = (long)(Math.random()*10)+1;
//					Long randomNumsLike = (long)(Math.random()*15)+1;
//					Long randomNumsView = (long)(Math.random()*20)+1;
//					System.out.println("com"+randomNumsCom);
//					System.out.println("lik"+randomNumsLike);
//					System.out.println("view"+randomNumsView);
//				}
//			}
//			
//		}
		// 1.生成httpclient，相当于该打开一个浏览器
//		CloseableHttpClient httpClient = HttpClients.createDefault();
//		CloseableHttpResponse response = null;
		// 2.创建get请求，相当于在浏览器地址栏输入 网址
//		HttpGet request = new HttpGet("http://www.nmns.edu.tw/web/park_cfpp/");
//		try {
			// 3.执行get请求，相当于在输入地址栏后敲回车键
//			response = httpClient.execute(request);

			// 4.判断响应状态为200，进行处理
//			if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				// 5.获取响应内容
//				HttpEntity httpEntity = response.getEntity();
//				String html = EntityUtils.toString(httpEntity, "utf-8");

//				JLabel label = new JLabel(html);
//				label.setSize(328, 400);
//
//				BufferedImage image = new BufferedImage(label.getWidth(), label.getHeight(), BufferedImage.TYPE_INT_ARGB);

//				{
					// paint the html to an image
//					Graphics g = image.getGraphics();
//					g.setColor(Color.BLACK);
//					label.paint(g);
//					g.dispose();
//				}

//				ByteArrayOutputStream baos = new ByteArrayOutputStream();
//				ImageIO.write(image, "jpg", baos);
//				byte[] bytes = baos.toByteArray();
//				ImageIO.write(image, "png", new File("C:\\Users\\jacke\\Desktop\\test\\test3.png"));
//			} else {
//				// 如果返回状态不是200，比如404（页面不存在）等，根据情况做处理，这里略
//				System.out.println("返回状态不是200");
//				System.out.println(EntityUtils.toString(response.getEntity(), "utf-8"));
//			}
//		} catch (ClientProtocolException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {
//			// 6.关闭
//			HttpClientUtils.closeQuietly(response);
//			HttpClientUtils.closeQuietly(httpClient);
//		}
		
	}

}
