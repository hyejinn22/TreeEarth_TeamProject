package action.community;

import javax.servlet.http.*;

import action.*;
import svc.community.*;
import vo.*;
import vo.community.*;

public class CampaignReviewModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		//수정할 글 번호 가져오기
		int cam_re_idx = Integer.parseInt(request.getParameter("cam_re_idx"));
		
		CampaignReviewDetailService service = new CampaignReviewDetailService();
		CampaignReviewDTO campaign_review = service.getCampaignReviewDetail(cam_re_idx);
		
		request.setAttribute("campaign_review", campaign_review);
		
		forward = new ActionForward();
		forward.setPath("CampaignReviewList.cm");
		forward.setRedirect(false);
		
		return forward;
	}

}
