package bit.com.a.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.a.login.BitMemberController;
import bit.com.a.model.BbsDto;
import bit.com.a.model.BbsParam;
import bit.com.a.model.BbsSerParam;
import bit.com.a.service.BitBbsService;

@Controller
public class BitBbsController {

	private static final Logger logger = LoggerFactory.getLogger(BitMemberController.class);
	
	@Autowired
	private BitBbsService bitBbsService;
	
	// bbslist
	@RequestMapping(value = "bbslist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bbslist(Model model, HttpServletRequest req) {
		logger.info("BitBbsController bbslist() " + new Date());
		
		model.addAttribute("doc_title", "글목록"); // 해당 controller에서 addAttribute 1순위
		
		//bbslist 가져와
		List<BbsDto> bbslist = bitBbsService.getBbsList();
		model.addAttribute("bbslist", bbslist);
		
		List<String> selectOpts = new ArrayList<String>(Arrays.asList("선택", "제목", "내용", "작성자"));
		model.addAttribute("selectOpts", selectOpts);
		
		return "bbslist.tiles";
	}
	
}
