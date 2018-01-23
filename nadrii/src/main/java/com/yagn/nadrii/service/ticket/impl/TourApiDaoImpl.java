package com.yagn.nadrii.service.ticket.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.service.domain.DetailIntro;
import com.yagn.nadrii.service.domain.SearchFestival;
import com.yagn.nadrii.service.domain.TourTicket;
import com.yagn.nadrii.service.ticket.TicketDao;

@Service("tourApiDaoImpl")
public class TourApiDaoImpl implements TicketDao {
	
	/// Field
	private SearchFestival searchFestival;
	private DetailIntro	 detailIntro;
	
	@Value("#{tourapiProperties['searchFestivalURL']}")
	private String searchFestivalURL;

	@Value("#{tourapiProperties['essentialURL']}")
	private String essentialURL;
	
	@Value("#{tourapiProperties['detailIntroURL']}")
	private String detailIntroURL;
	
	/// Constructor
	public TourApiDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public static final StringBuilder sendGetURL(StringBuilder urlBuilder) throws Exception {
		
		System.out.println("\n[TourApiDaoImpl.java]::sendGetURL");

		URL url = new URL(urlBuilder.toString());
		
//		System.out.println("\n[URL Check] ==>" + url);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		
		/*
		System.out.println("Response code: " + conn.getResponseCode());
		System.out.println("//=====[sendGetURL 확인]\n");
		//*/
		
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}

		rd.close();
		conn.disconnect();

		return sb;

	}
	
	public Map<String, Object> getSearchFestival() throws Exception {
		
		System.out.println("\n[TourApiDaoImpl.java]::getSearchFestival");
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		StringBuilder searchFestivalSB = TourApiDaoImpl.sendGetURL(new StringBuilder(searchFestivalURL + essentialURL));
		
		JSONObject sfJsonObj = (JSONObject) JSONValue.parse(searchFestivalSB.toString());
		JSONObject sfResponse = (JSONObject) sfJsonObj.get("response");
		JSONObject sfHeader = (JSONObject) sfResponse.get("header");
		JSONObject sfBody = (JSONObject) sfResponse.get("body");
		JSONObject sfItems = (JSONObject) sfBody.get("items");
		JSONArray sfItem = (JSONArray) sfItems.get("item"); 

		/* parse data confirm
		System.out.println("[sfJsonObj] ==>" + sfJsonObj);
		System.out.println("//=====");
		System.out.println("[sfResponse] ==>" + sfResponse);
		System.out.println("//=====");
		System.out.println("[sfHeader] ==>" + sfHeader);
		System.out.println("//=====");
		System.out.println("[sfBody] ==>" + sfBody);
		System.out.println("//=====");
		System.out.println("[sfItems] ==>" + sfItems);
		System.out.println("//=====");
		System.out.println("[sfItem] ==>" + sfItem);
		System.out.println("//=====");
		//*/
		
		List<SearchFestival> searchFestivalList = new ArrayList<SearchFestival>();
		List<DetailIntro> detailIntroList = new ArrayList<DetailIntro>();
		List<TourTicket> tourTicketList = new ArrayList<TourTicket>();
		
		for (int i = 0; i < sfItem.size(); i++) {
			
			JSONObject itemValue = (JSONObject) sfItem.get(i);
			
			ObjectMapper objectMapper = new ObjectMapper();
			searchFestival = new SearchFestival();
			searchFestival = objectMapper.readValue(itemValue.toJSONString(), SearchFestival.class);

			DetailIntro detailIntro = new DetailIntro();
			detailIntro = this.getDetailIntro(searchFestival.getContentid(), searchFestival.getContenttypeid());
			
			TourTicket tourTicket = new TourTicket();
			
			tourTicket.setContentid(searchFestival.getContentid());
			tourTicket.setContenttypeid(searchFestival.getContenttypeid());
			tourTicket.setEventstartdate(searchFestival.getEventstartdate());
			tourTicket.setEventenddate(searchFestival.getEventenddate());
			tourTicket.setFirstimage(searchFestival.getFirstimage());
			tourTicket.setFirstimage2(searchFestival.getFirstimage2());
			tourTicket.setReadcount(searchFestival.getReadcount());
			tourTicket.setTitle(searchFestival.getTitle());
			tourTicket.setTel(searchFestival.getTel());
			tourTicket.setAreacode(searchFestival.getAreacode());
			tourTicket.setSigungucode(searchFestival.getSigungucode());
			
			tourTicket.setAgelimit(detailIntro.getAgelimit());
			tourTicket.setBookingplace(detailIntro.getBookingplace());
			tourTicket.setDiscountinfofestival(detailIntro.getDiscountinfofestival());
			tourTicket.setEventhomepage(detailIntro.getEventhomepage());
			tourTicket.setEventplace(detailIntro.getEventplace());
			tourTicket.setFestivalgrade(detailIntro.getFestivalgrade());
			tourTicket.setPlaceinfo(detailIntro.getPlaceinfo());
			tourTicket.setPlaytime(detailIntro.getPlaytime());
			tourTicket.setProgram(detailIntro.getProgram());
			tourTicket.setSpendtimefestival(detailIntro.getSpendtimefestival());
			tourTicket.setSponsor1tel(detailIntro.getSponsor1tel());
			tourTicket.setSponsor2tel(detailIntro.getSponsor2tel());
			tourTicket.setSponsor1(detailIntro.getSponsor1());
			tourTicket.setSponsor2(detailIntro.getSponsor2());
			tourTicket.setSubevent(detailIntro.getSubevent());
			tourTicket.setUsetimefestival(detailIntro.getUsetimefestival());
			
			searchFestivalList.add(searchFestival);
			detailIntroList.add(detailIntro);  
			tourTicketList.add(tourTicket);
			
			map.put("searchFestivalList", searchFestivalList);
			map.put("detailIntroList", detailIntroList);
			map.put("tourTicketList", tourTicketList);
			
		}
		
		return map;
		
	}

	public DetailIntro getDetailIntro(int ContentId, int ContentTypeId) throws Exception {
		
		System.out.println("\n[TourApiDaoImpl.java]::getDetailIntro");

		List<DetailIntro> list = new ArrayList<DetailIntro>();
		
		StringBuilder detailIntroSB = TourApiDaoImpl
				.sendGetURL(new StringBuilder(detailIntroURL + essentialURL 
						+ "&introYN=Y" 
						+ "&contentId="	+ ContentId 
						+ "&contentTypeId=" + ContentTypeId
						));
		
		JSONObject diJsonObj = (JSONObject) JSONValue.parse(detailIntroSB.toString());

		JSONObject diResponse = (JSONObject) diJsonObj.get("response");
		JSONObject diHeader = (JSONObject) diResponse.get("header");
		JSONObject diBody = (JSONObject) diResponse.get("body");
		JSONObject diItems = (JSONObject) diBody.get("items");
		JSONObject diItem = (JSONObject) diItems.get("item");
		
		/* parse data confirm
		System.out.println("[diJsonObj] ==>" + diJsonObj);
		System.out.println("//=====");
		System.out.println("[diResponse] ==>" + diResponse);
		System.out.println("//=====");
		System.out.println("[diHeader] ==>" + diHeader);
		System.out.println("//=====");
		System.out.println("[diBody] ==>" + diBody);
		System.out.println("//=====");
		System.out.println("[diItems] ==>" + diItems);
		System.out.println("//=====");
		System.out.println("[diItem] ==>" + diItem);
		System.out.println("//=====");
		//*/

		ObjectMapper objectMapper = new ObjectMapper();
		detailIntro = new DetailIntro();
		detailIntro = objectMapper.readValue(diItem.toJSONString(), DetailIntro.class);
		
		list.add(detailIntro); 
		
		return detailIntro;
	}
	
}
