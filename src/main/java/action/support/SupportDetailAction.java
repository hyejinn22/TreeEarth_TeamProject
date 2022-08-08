package action.support;

import javax.servlet.http.*;

import action.Action;
import svc.*;
import svc.support.SupportDetailServiceAdmin;
import vo.*;
import vo.support.SupportDTO;

public class SupportDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("3. SupportWrite 액션");
		ActionForward forward = null;
		
		
		// ----------------------------------------------------------------------------------------
		
			
		//글 번호 받아오기
		int sup_idx = Integer.parseInt(request.getParameter("sup_idx"));
		
		//dto 객체에 값 저장
		
		
		
		
	// ----------------------------------------------------------------------------------------

		
		//서비스 호출(데이터 조회)
		SupportDetailServiceAdmin service = new SupportDetailServiceAdmin();
		SupportDTO dto = service.getBoard(sup_idx);
		
		
		request.setAttribute("dto", dto);
	// ----------------------------------------------------------------------------------------

		
		//데이터 리턴
		System.out.println("7. SupportWrite성공");
		forward = new ActionForward();
		forward.setPath("support/supprot_detail.jsp");//서푸로트 검거
		forward.setRedirect(false);
		
		return forward;
		
	}
	
	

}
