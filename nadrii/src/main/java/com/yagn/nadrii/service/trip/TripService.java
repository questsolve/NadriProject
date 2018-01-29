package com.yagn.nadrii.service.trip;

import java.util.Map;

import com.yagn.nadrii.service.domain.Trip;
import com.yagn.nadrii.service.trip.domain.TourApiDomain;

public interface TripService {
	
	public Map listTrip(int pageNo, String contentTypeId, String cat1, String cat2, String cat3) throws Exception;
	
	public TourApiDomain getTrip(String contentId, String contentTypeid) throws Exception;
	
	public TourApiDomain getTripDetail(String contentId, String contentTypeid)throws Exception;

	public Trip tripCheckDuplication(String contentid) throws Exception;
	
	public void addTriptoDB(Trip trip) throws Exception;
	
	public Trip getTripFromDB(String contentId)throws Exception;
}
