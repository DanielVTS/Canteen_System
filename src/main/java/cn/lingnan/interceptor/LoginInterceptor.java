package cn.lingnan.interceptor;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
//请求之前，在请求方法之前
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        System.out.println("preHandle:::" + request.getRequestURL());
        StringBuffer url = request.getRequestURL();
        if(url.toString().endsWith("Canteen_System_war/")||url.toString().endsWith("/error")){
            return true;
        }
        if (url.toString().endsWith("/login") || url.toString().endsWith("/register")) {
            return true;
        }
        else {
            Object o = request.getSession().getAttribute("loginUser");

            if (o == null) {
                request.setAttribute("msg", "not login");
                request.getRequestDispatcher("error").forward(request, response);
            } else {
                return true;
            }
        }
        return false;
    }

    @Override
//请求通过，是方法里面的代码执行之后
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("afterCompletion");
    }
}
