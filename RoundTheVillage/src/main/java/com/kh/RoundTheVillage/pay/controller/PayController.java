package com.kh.RoundTheVillage.pay.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonObject;
import com.kh.RoundTheVillage.pay.model.service.PayService;

@Controller
@RequestMapping("/pay/*")
public class PayController {

	@Autowired
	private PayService service;

	@RequestMapping("pay")
	public String pay() {
		return "pay/pay";
	}

	@RequestMapping("payAction")
	public String payAction(@RequestParam("imp_uid") String imp_uid) {
		
		System.out.println(imp_uid);

//		// 아임포트 토큰생성
//		String imp_key = URLEncoder.encode("0919424130748436", "UTF-8");
//		String imp_secret = URLEncoder.encode("xk8sstOupVsS8TZwYMWObftG2emrL4qiozLQ2zksuMkCGk9F65tilWYnblPXpggNQ1ETAYm5LHHs1R78", "UTF-8");
//
//		JSONObject json = new JSONObject();
//		json.put("imp_key", imp_key);
//		json.put("imp_secret", imp_secret);
//
//		String _token = getToken(request, response, json);
		
		
		return null;
	}

	@RequestMapping("complete")
	public String complete() {
		return "pay/complete";
	}

	@RequestMapping("list")
	public String list() {
		return "pay/list";
	}

	@RequestMapping("view")
	public String view() {
		return "pay/view";
	}

	public String getToken(HttpServletRequest request, HttpServletResponse response, JSONObject json) throws Exception {

		String _token = "";

		try {

			String requestString = "";

			URL url = new URL("https://api.iamport.kr/users/getToken");

			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setInstanceFollowRedirects(false);
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");

			OutputStream os = connection.getOutputStream();
			os.write(json.toString().getBytes());

			connection.connect();

			StringBuilder sb = new StringBuilder();

			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));

				String line = null;
				while ((line = br.readLine()) != null) {
					sb.append(line + "\n");
				}

				br.close();
				requestString = sb.toString();
			}

			os.flush();
			connection.disconnect();

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);

			if ((Long) jsonObj.get("code") == 0) {
				JSONObject getToken = (JSONObject) jsonObj.get("response");
				System.out.println("getToken==>> " + getToken.get("access_token"));
				_token = (String) getToken.get("access_token");
			}
		} catch (Exception e) {
			e.printStackTrace();
			_token = "";
		}

		return _token;
	}
}
