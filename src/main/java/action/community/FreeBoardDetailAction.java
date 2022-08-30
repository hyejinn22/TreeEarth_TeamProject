package action.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.FreeBoardDetailService;
import vo.ActionForward;
import vo.community.FreeboardDTO;

public class FreeBoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FreeBoardDetailAction");
			
			ActionForward forward = null;
			
			int free_idx = Integer.parseInt(request.getParameter("free_idx"));

			FreeBoardDetailService service = new FreeBoardDetailService();
			service.increaseReadcount(free_idx);
			
			FreeboardDTO freeboard = service.getBoard(free_idx);
			
			request.setAttribute("freeboard", freeboard);
			
			forward = new ActionForward();
			forward.setPath("community/freeboard_detail.jsp");
			forward.setRedirect(false);
			
			return forward;
		}
	
	}