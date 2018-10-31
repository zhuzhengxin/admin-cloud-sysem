package pers.liuqing.cloudsys.admin.common.util;

import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class HttpClientTest {
	public static void main(String strings[])
	{
		HttpClient httpclient = new DefaultHttpClient();
		try
		{
			HttpGet getMethod=new HttpGet("https://sso.teamshub.com/login");
			getMethod.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36");
			HttpResponse response=httpclient.execute(getMethod);
			Header arrHeaders[]=response.getAllHeaders();
			EntityUtils.consume(response.getEntity());


			HttpPost postMethod=new HttpPost("https://sso.teamshub.com/getKey");
			getMethod.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36");
			postMethod.setHeader("Referer", "https://sso.teamshub.com");
			List<NameValuePair> params=new ArrayList<NameValuePair>();
			/*params.add(new BasicNameValuePair("lt","LT-71653-6mjDrAkOKGtlgaaA4ZS7e3DH6rfeSD"));
			params.add(new BasicNameValuePair("execution","e1s1"));
			params.add(new BasicNameValuePair("_eventId","submit"));
			params.add(new BasicNameValuePair("username","13053088037"));
			params.add(new BasicNameValuePair("password","liuqinga5"));*/
			//添加参数
			//postMethod.setEntity(new UrlEncodedFormEntity(params,HTTP.UTF_8));
			//postMethod.setHeaders(arrHeaders);
			response=httpclient.execute(postMethod);
			EntityUtils.consume(response.getEntity());
			System.out.println(response.getStatusLine().getStatusCode());
			System.out.println(response.getEntity());
			/*class PostThread implements  Runnable
			{
				private HttpClient myclient=null;
				private int num=23453234;
				public PostThread(HttpClient client)
				{
					myclient=client;
				}
				@Override
				public void run() {
					// TODO Auto-generated method stub
					while(true)
					{
						HttpPost postMethod=new HttpPost("http://e.neusoft.edu.cn/rechargecard.action");
						postMethod.setHeader("User-Agent", "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)");
						postMethod.setHeader("Referer", "http://e.neusoft.edu.cn/nav_Rcard");
						List<NameValuePair> params=new ArrayList<NameValuePair>();
						params.add(new BasicNameValuePair("cardName","046uijalz101480"));
						params.add(new BasicNameValuePair("cardPsw",""+num++));
						params.add(new BasicNameValuePair("Submit","提 交"));
						HttpResponse response;
						try {
							postMethod.setEntity(new UrlEncodedFormEntity(params,HTTP.UTF_8));
							response = myclient.execute(postMethod);
							EntityUtils.consume(response.getEntity());
						} catch (ClientProtocolException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}

				}

			};


			PostThread mPostThread=new PostThread(httpclient);
			mPostThread.run();*/

		}
		catch (IOException e)
		{

		}
		finally
		{

		}
	}

}  