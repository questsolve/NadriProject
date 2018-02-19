package com.yagn.nadrii.web.wish;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yagn.nadrii.service.comm.CommService;
import com.yagn.nadrii.service.domain.Community;
import com.yagn.nadrii.service.domain.Trip;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.domain.Wish;
import com.yagn.nadrii.service.trip.TripService;
import com.yagn.nadrii.service.wish.WishService;

@RestController
@RequestMapping("/wish/*")
public class WishController {
	
	@Autowired
	@Qualifier("wishServiceImpl")
	private WishService wishService;
	
	@Autowired
	@Qualifier("commServiceImpl")
	private CommService CommService;
	
	@Autowired
	@Qualifier("tripServiceImpl")
	private TripService tripService;
	
		
	public WishController() {
		System.out.println(this.getClass());
	}

	@RequestMapping("/addWishFromTrip/{contentId}")
	public void addWishFromTrip(HttpServletRequest request, @PathVariable("contentId") String contentId) throws Exception{
		
		
		System.out.println("RestController addWishFromTrip");
		
		//
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("loginUser");
		System.out.println(user);
		
		
		Thread.sleep(1000);
		
		//
		Trip trip = tripService.getTripFromDB(contentId);
		System.out.println(trip);
		
		//
		//if()
		
		Wish wish = new Wish();
		wish.setUserId(user.getUserId());
		wish.setTripNo(trip);
		System.out.println(wish);
		
		wishService.addWishListFromTrip(wish);
		
		
	}
	
	@RequestMapping("/addWishFromPost/{postNo}")
	public void addWishFromPost(@PathVariable("postNo")int postNo, HttpServletRequest request) throws Exception{
		
		System.out.println("RestController addWishFromPost");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		
		
		System.out.println(user);
		Thread.sleep(1000);
		Community community = CommService.getComm(postNo);
		System.out.println(community);
		Wish wish = new Wish();
		wish.setUserId(user.getUserId());
		wish.setPostNo(community.getPostNo());
		System.out.println(wish);
		
		wishService.addWishListFromPost(wish);
		
		
	}
	
	
	//
	
	private Wish getWishByTripNo(HttpSession session,HttpServletRequest request,@PathVariable("tripNo") int tripNo) throws Exception {
		session =request.getSession(true);
		User user = (User)session.getAttribute("loginUser");
		Map map = new HashMap();
				
		
		Wish wish = wishService.getWishByTripNo(user.getUserId(), tripNo);
		return wish;
	}
	
	
	
	@RequestMapping("/listWish/{userId}")
	public String listWish(Map map, HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("listWish");
		session = request.getSession(true);
				
		String userId = (String)session.getAttribute("loginUser");
		
		Map wishMap = wishService.listWish(userId);
		
		
		map.put("wishMap", wishMap.get("list"));
		
		return "forward://planner/wishList/ListWishList.jsp";
	}
	
	
	@RequestMapping("/deleteWish/{wishNo}")
	public void deleteWish(int wishNo) throws Exception{
		System.out.println("deleteWish");
		wishService.deleteWish(wishNo);
		
		
	}
	

}
