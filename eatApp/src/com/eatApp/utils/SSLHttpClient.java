package com.eatApp.utils;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;

public class SSLHttpClient {
	/**
	 * 注册SSL连接
	 * @param hostname 请求的主机名（IP或�?域名�?
	 * @param protocol 请求协议名称（TLS-安全传输层协议）
	 * @param port 端口�?
	 * @param scheme 协议名称
	 * @return HttpClient实例
	 * @throws NoSuchAlgorithmException
	 * @throws KeyManagementException
	 */
	public DefaultHttpClient registerSSL(String hostname,String protocol,int port,String scheme)throws NoSuchAlgorithmException, KeyManagementException {
		//创建�?��默认的HttpClient
		DefaultHttpClient httpclient = new DefaultHttpClient();
		//创建SSL上下文实�?
		SSLContext ctx = SSLContext.getInstance(protocol);
		//服务端证书验�?
		X509TrustManager tm = new X509TrustManager() {
		   /**
		    * 验证客户端证�?
		    */
		   @Override
		   public void checkClientTrusted(X509Certificate[] chain,String authType)
			 throws java.security.cert.CertificateException {
			 //这里跳过客户端证�?验证	
		   }

		   /**
		    * 验证服务端证�?
		    * @param chain 证书�?
		    * @param authType 使用的密钥交换算法，当使用来自服务器的密钥时authType为RSA
		    */
		   @Override
		   public void checkServerTrusted(X509Certificate[] chain,String authType)
			 throws java.security.cert.CertificateException {
			   if (chain == null || chain.length == 0)   
		           throw new IllegalArgumentException("null or zero-length certificate chain");   
		       if (authType == null || authType.length() == 0)   
		           throw new IllegalArgumentException("null or zero-length authentication type");   
		   
		       boolean br = false;   
		       Principal principal = null;   
		       for (X509Certificate x509Certificate : chain) {   
		           principal = x509Certificate.getSubjectX500Principal();   
		           if (principal != null) {
		               br = true;   
		               return;   
		           }   
		       }   
		       if (!br) {   
		          throw new CertificateException("服务端证书验证失败！");   
		       }   
		   }
		   /**
		    * 返回CA发行的证�?
		    */
		   @Override
		   public X509Certificate[] getAcceptedIssuers() {
			   return new X509Certificate[0];
		   }
		};
		//初始化SSL上下�?
		ctx.init(null, new TrustManager[]{tm}, new java.security.SecureRandom());
		//创建SSL连接
		SSLSocketFactory socketFactory = new SSLSocketFactory(ctx,SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
		Scheme sch = new Scheme(scheme, port, socketFactory);
		//注册SSL连接
		httpclient.getConnectionManager().getSchemeRegistry().register(sch);
		return httpclient;
	} 
}
