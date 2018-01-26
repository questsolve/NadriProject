package com.yagn.nadrii.service.ticket.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.yagn.nadrii.common.OpenApiPage;
import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.DetailImage;
import com.yagn.nadrii.service.domain.DetailIntro;
import com.yagn.nadrii.service.domain.SearchFestival;
import com.yagn.nadrii.service.domain.TourTicket;
import com.yagn.nadrii.service.ticket.TicketDao;

@Repository("tourApiDaoImpl")
public class TourApiDaoImpl implements TicketDao {
	
	/// Field
	
	private SearchFestival searchFestival;
	private DetailIntro	 detailIntro;
	private DetailImage detailImgae;
	
	/// TourAPI properties
	@Value("#{tourApiProperties['searchFestivalURL']}")
	private String searchFestivalURL;
	@Value("#{tourApiProperties['essentialURL']}")
	private String essentialURL;
	@Value("#{tourApiProperties['detailIntroURL']}")
	private String detailIntroURL;
	@Value("#{tourApiProperties['detailImageURL']}")
	private String detailImageURL;
	
	/// Constructor
	public TourApiDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public static final StringBuilder sendGetTourURL(StringBuilder urlBuilder) throws Exception {
		
		System.out.println("\n[TourApiDaoImpl.java]::sendGetTourURL");

		URL url = new URL(urlBuilder.toString());
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");

		System.out.println("Response code: " + conn.getResponseCode());
		
		BufferedReader br;
		if (conn.getResponseCode() == 200) {
			br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		} else {
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}

		br.close();
		conn.disconnect();

		return sb;

	}
	
	
	public Map<String, Object> getTicketList(OpenApiSearch openApiSearch) throws Exception {
		
		System.out.println("\n[OpenApiDaoImpl.java]::getTicketList");
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		StringBuilder searchFestivalSB = TourApiDaoImpl.sendGetTourURL(
				new StringBuilder(
						searchFestivalURL 
						+ essentialURL
						+ "&pageNo=" + openApiSearch.getPageNo()
						));
		
		JSONObject sfJsonObj = (JSONObject) JSONValue.parse(searchFestivalSB.toString());
		JSONObject sfResponse = (JSONObject) sfJsonObj.get("response");
		JSONObject sfHeader = (JSONObject) sfResponse.get("header");
		
		JSONObject sfBody = (JSONObject) sfResponse.get("body");
		ObjectMapper sfBodyMapper = new ObjectMapper();
		OpenApiPage openApiPage = new OpenApiPage();
		openApiPage = sfBodyMapper.readValue(sfBody.toJSONString(), OpenApiPage.class);
		
		System.out.println(""+openApiPage);
		
		map.put("totalCount", openApiPage.getTotalCount());
		
		JSONObject sfItems = (JSONObject) sfBody.get("items");
		JSONArray sfItem = (JSONArray) sfItems.get("item"); 

		List<TourTicket> tourTicketList = new ArrayList<TourTicket>();
		
		for (int i = 0; i < sfItem.size(); i++) {
			
			JSONObject itemValue = (JSONObject) sfItem.get(i);
			
			ObjectMapper objectMapper = new ObjectMapper();
			searchFestival = new SearchFestival();
			searchFestival = objectMapper.readValue(itemValue.toJSONString(), SearchFestival.class);

			DetailIntro detailIntro = new DetailIntro();
			detailIntro = this.getDetailIntro(searchFestival.getContentid(), searchFestival.getContenttypeid());
			
			TourTicket tourTicket = new TourTicket();
			// searchFestival domain set
			tourTicket.setContentid(searchFestival.getContentid());
			tourTicket.setContenttypeid(searchFestival.getContenttypeid());
			tourTicket.setEventstartdate(searchFestival.getEventstartdate());
			tourTicket.setEventenddate(searchFestival.getEventenddate());
			
			///* if there is no image, you should control about it.
			if (searchFestival.getFirstimage() == null || searchFestival.getFirstimage() == "") {
				tourTicket.setFirstimage(searchFestival.getFirstimage());
				
			} else {
//				tourTicket.setFirstimage(searchFestival.getFirstimage());
			}
			
			
			tourTicket.setFirstimage2(searchFestival.getFirstimage2());
			tourTicket.setReadcount(searchFestival.getReadcount());
			tourTicket.setTitle(searchFestival.getTitle());
			tourTicket.setTel(searchFestival.getTel());
			tourTicket.setAreacode(searchFestival.getAreacode());
			tourTicket.setSigungucode(searchFestival.getSigungucode());
			// detailIntro domain set
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
			
//			searchFestivalList.add(searchFestival);
//			detailIntroList.add(detailIntro);  
			tourTicketList.add(tourTicket);
			
//			map.put("searchFestivalList", searchFestivalList);
//			map.put("detailIntroList", detailIntroList);
			map.put("tourTicketList", tourTicketList);
			
		}
		
		return map;
		
	}

	public DetailIntro getDetailIntro(int contentId, int contentTypeId) throws Exception {
		
		System.out.println("\n[OpenApiDaoImpl.java]::getDetailIntro");

		StringBuilder detailIntroSB = TourApiDaoImpl
				.sendGetTourURL(new StringBuilder(detailIntroURL + essentialURL 
						+ "&introYN=Y" 
						+ "&contentId="	+ contentId 
						+ "&contentTypeId=" + contentTypeId
						));
		
		JSONObject diJsonObj = (JSONObject) JSONValue.parse(detailIntroSB.toString());

		JSONObject diResponse = (JSONObject) diJsonObj.get("response");
		JSONObject diHeader = (JSONObject) diResponse.get("header");
		JSONObject diBody = (JSONObject) diResponse.get("body");
		JSONObject diItems = (JSONObject) diBody.get("items");
		JSONObject diItem = (JSONObject) diItems.get("item");
		
		ObjectMapper objectMapper = new ObjectMapper();
		detailIntro = new DetailIntro();
		detailIntro = objectMapper.readValue(diItem.toJSONString(), DetailIntro.class);
		
		return detailIntro;
	}
	
	public DetailImage getDetailImage(int contentId) throws Exception {

		System.out.println("\n[OpenApiDaoImpl.java]::getDetailImage");

		DetailImage detailImage = new DetailImage();

		StringBuilder detailImageSB = TourApiDaoImpl.sendGetTourURL(new StringBuilder(
				detailImageURL + essentialURL + "&contentId=" + contentId + "&imageYN=Y" + "&subImageYN=Y"));

		JSONObject diJsonObj = (JSONObject) JSONValue.parse(detailImageSB.toString());
		JSONObject diResponse = (JSONObject) diJsonObj.get("response");
		JSONObject diHeader = (JSONObject) diResponse.get("header");
		JSONObject diBody = (JSONObject) diResponse.get("body");

		if (diBody.get("items").toString().equals("")) {
			
			System.out.println("[response] :: Null");
			
			detailImage.setContentid(000000);
			detailImage.setImagename("요청 페이지가 없습니다.");
			detailImage.setOriginimgurl("http://placehold.it/350X230");
			detailImage.setSerialnum("요청 페이지가 없습니다.");
			detailImage.setSmallimageurl("http://placehold.it/350X230");

			return detailImage;
			
		} else {
			
			JSONObject diItems = (JSONObject) diBody.get("items");

			if (diItems.get("item") instanceof JSONObject) {

				System.out.println("[response] :: diItems instanceof = JSONObject");

				JSONObject item = (JSONObject) diItems.get("item");

				ObjectMapper objectMapper = new ObjectMapper();
				detailImage = new DetailImage();
				detailImage = objectMapper.readValue(item.toJSONString(), DetailImage.class);

			}
			
			if (diItems.get("item") instanceof JSONArray) {
				
				System.out.println("[response] :: diItems instanceof = JSONArray");

				JSONArray diItem = (JSONArray) diItems.get("item");
				
				for (int i = 0; i < diItem.size(); i++) {
					
					JSONObject value = (JSONObject) diItem.get(i);
					
					ObjectMapper objectMapper = new ObjectMapper();
					detailImage = new DetailImage();
					detailImage = objectMapper.readValue(value.toJSONString(), DetailImage.class);
					
				}
			}
		}
		return detailImage;
	}
	
	////////////////////////////////////////////////////////////////////////////////
	public String getNaverImage(String title) throws Exception {
		return null;
	}
	
} // end of class
