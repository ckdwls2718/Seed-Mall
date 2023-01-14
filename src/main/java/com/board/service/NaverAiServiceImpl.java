package com.board.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NaverAiServiceImpl implements NaverAiService {

	@Override
	public int sentimentAnalyze(String content) throws Exception {
		log.info("content==="+content);
		String clientId="d1oeu6yejj";
		String clientSecret="6JAEUI5P0pv2tnc64afrRu82suQkRlzCO7P9xn56";
		String urlStr="https://naveropenapi.apigw.ntruss.com/sentiment-analysis/v1/analyze";
		
		URL url=new URL(urlStr);
		URLConnection urlCon=url.openConnection();
		HttpURLConnection con=(HttpURLConnection)urlCon;
		StringBuffer response=new StringBuffer();
		con.setRequestMethod("POST");//요청방식 설정
		con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
		con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
		con.setRequestProperty("Content-Type", "application/json");
		
		JSONObject json=new JSONObject();
		json.put("content", content);
		
		String params=json.toString();
		log.info("params====="+params);
		con.setUseCaches(false);
		con.setDoOutput(true);
		con.setDoInput(true);
		
		//네이버 클라우드 서버로 요청 파라미터 데이터를 전송하기 위한 스트림 생성
		OutputStream os=con.getOutputStream();
		BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(os,"UTF-8"));
		bw.write(params);
		bw.flush();
		bw.close();
		os.close();
		int responseCode=con.getResponseCode();
		log.info("responseCode===="+responseCode);
		BufferedReader br;
		if(responseCode==200) {
			br=new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
		}else {
			log.info("Error발생: "+responseCode);
			br=new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
		}
		String line="";
		if(br!=null) {
			while((line=br.readLine())!=null) {
				response.append(line);
			}
			br.close();
		}
		log.info("response==="+response.toString());
		JSONObject result=new JSONObject(response.toString());
		JSONObject document = result.getJSONObject("document");
		String sentiment=document.getString("sentiment");
		
		log.info("sentiment = "+sentiment);
		
		int sentimentNum = 0;
		
		if(sentiment.equals("negative")) {
			sentimentNum = 1;
		} else if(sentiment.equals("negative")) {
			sentimentNum = 2;
		} else {
			sentimentNum = 3;
		}
		
		
		return sentimentNum;
	}

}
