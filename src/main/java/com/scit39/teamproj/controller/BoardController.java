package com.scit39.teamproj.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.scit39.teamproj.service.BoardService;
import com.scit39.teamproj.util.FileService;
import com.scit39.teamproj.util.PageNavigator;
import com.scit39.teamproj.vo.BoardVO;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	private String uploadPath = "/boardfile";
	private final int COUNTPERPAGE = 10;
	private final int PAGEPERGROUP = 5;
	
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public String boardList(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "searchText", defaultValue = "") String searchText,
			@RequestParam(value = "searchType", defaultValue = "none") String searchType, 
			Model model) {
		
		//전체 글 갯수 조회(검색을 했을 때도 검색에 해당하는 글의 전체 갯수도 조회)
		int count = service.boardCount(searchText, searchType);
		
		//페이지 객체 생성
		PageNavigator navi = new PageNavigator(COUNTPERPAGE, PAGEPERGROUP, page, count);
		
		//글 목록을 조회한 후에 Model에 저장
		ArrayList<HashMap<String, Object>> list = service.boardList(searchText, searchType, navi.getStartRecord(), navi.getCountPerPage());
		
		logger.info("list의 사이즈 {}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("navi", navi);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardWriteForm", method=RequestMethod.GET)
	public String boardWriteForm() {
		
		return "board/boardWriteForm";
	}
	
	@RequestMapping(value="/boardWrite", method=RequestMethod.POST)
	public String boardWrite(BoardVO board, MultipartFile upload) {
		
		//upload -> 파일이 있다면
		if(!upload.isEmpty()) {
			//물리적 파일 저장
			String savedfile = FileService.saveFile(upload, uploadPath);
			//논리적 파일 저장
			board.setSavedfile(savedfile);
			board.setOriginalfile(upload.getOriginalFilename());
		}
		
		service.boardWrite(board);
		
		return "redirect:/board/boardList";
	}
	
	@RequestMapping(value="/boardRead", method=RequestMethod.GET)
	public String boardRead(Model model, int board_no) {
		HashMap<String, Object> map = service.boardRead(board_no);
		model.addAttribute("map", map);
		
		return "board/boardRead";
	}
	
	@RequestMapping(value="/boardDelete", method=RequestMethod.GET)
	public String boardDelete(int board_no) {
		int cnt = service.boardDelete(board_no);
		
		if(cnt == 0) {
			logger.info("삭제 실패 : {}", board_no);
		}else {
			logger.info("삭제 성공 : {}", board_no);
		}
		
		return "redirect:/board/boardList";
	}
	
	@RequestMapping(value="/boardUpdateForm", method=RequestMethod.GET)
	public String boardUpdateForm(int board_no, Model model) {
		HashMap<String, Object> map = service.boardRead(board_no);
		model.addAttribute("map", map);
		
		return "board/boardUpdateForm";
	}
	
	@RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(BoardVO board) {
		int cnt = service.boardUpdate(board);
		
		if(cnt == 0) {
			logger.info("수정 실패 : {}", board);
		}else {
			logger.info("수정 성공 : {}", board);
		}
		
		return "redirect:/board/boardList";
	}
	/*
	@RequestMapping(value="/searchBoard", method=RequestMethod.GET)
	public String searchBoard(String searchText, String searchType, Model model) {
		ArrayList<HashMap<String, Object>> list = service.searchBoard(searchText, searchType);
		model.addAttribute("list", list);
		
		return "board/boardList";
	}
	*/
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public String fileDownload(int board_no, HttpServletResponse response) {
		
		BoardVO board = service.boardSelectOne(board_no);
		
		//원래의 파일명
		String originalfile = new String(board.getOriginalfile());
		try {
			//설정만 해 놓은 상태
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//저장된 파일 경로
		String fullPath = uploadPath + "/" + board.getSavedfile();
		
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;			//물리적인 공간에 파일을 WebApplication으로 가져오기 위해
		ServletOutputStream fileout = null;		//WebApplication에서 파일객체를 사용자의 브라우저로 전달하기 위해
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	
}
