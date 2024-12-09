package routeServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class requestURIReturn {

	public static void returnURL(HttpServletRequest request) {
		request.setAttribute("currentURI", request.getRequestURI());
	}
}
