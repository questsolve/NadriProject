package com.yagn.nadrii.service.trip.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Trip;
import com.yagn.nadrii.service.trip.TripDao;
import com.yagn.nadrii.service.trip.domain.ImageDomain;
import com.yagn.nadrii.service.trip.domain.TourApiDomain;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetDetailUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPlListUrlManage;

public class TripDaoImplImageSearch implements TripDao {
	
	

	public TripDaoImplImageSearch() {
	
	}

	@Override
	public List listTrip(TourAPlListUrlManage tourAPlUrlManage) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TourApiDomain getTrip(TourAPIGetUrlManage tourAPIGetUrlManage) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TourApiDomain getTripDetail(TourAPIGetDetailUrlManage tourAPIGetDetailUrlManage) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String naverImageSearch(String target)throws Exception{
		
		System.out.println("네이버 이미지 검색");
		int display = 100;
        String clientId = "YaTN_waxR7h6HvXakGB2";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "dHdqCyawjm";//애플리케이션 클라이언트 시크릿값";
        String text = URLEncoder.encode(target, "UTF-8");
        String apiURL = "https://openapi.naver.com/v1/search/image?query="+ text+"&display="+display; // json 결과
        
        //naver 이미지 검색 실행
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("X-Naver-Client-Id", clientId);
        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        
        
        BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
        
        JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
        //System.out.println("JsonObject : "+jsonobj);
        JSONArray items = (JSONArray)jsonobj.get("items");
        //System.out.println("items : "+ items);
        
        List list = new ArrayList();
        for (int i = 0; i < items.size(); i++) {
	        JSONObject tempObj = (JSONObject)items.get(i);
	        //System.out.println(tempObj);
	        ObjectMapper objectMapper = new ObjectMapper();
			ImageDomain imageDomain = new ImageDomain();
			imageDomain = objectMapper.readValue(tempObj.toString(), ImageDomain.class);
			list.add(imageDomain);
			//System.out.println( ( (ImageDomain)list.get(i) ).getLink());
			
		}
                   
        if(list.size()!=0) {
        	return ( (ImageDomain)list.get(0) ).getLink();
        }else {
        	return "이미지 없음";
        }
	}

	@Override
	public void addTrip(Trip trip) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Trip getTrip(int postNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Trip> listTrip(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateViewCount(int postNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
