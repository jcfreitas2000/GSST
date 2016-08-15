package br.com.gsst.controller;

import br.com.gsst.model.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response,
            Object controller) throws Exception {

        String uri = request.getRequestURI();
        String url_absoluta = request.getContextPath();
        Usuario user = (Usuario) request.getSession().getAttribute("usuarioLogado");

        if (user == null) {
            if (uri.startsWith(url_absoluta + "/user/") ||uri.startsWith(url_absoluta + "/admin/")) {
                response.sendRedirect(url_absoluta + "/entrar");
                return false;
            }
        } else {
            if (uri.startsWith(url_absoluta + "/admin/")) {
                    if (user.getNivelAcesso()== null || !user.getNivelAcesso().equals("admin")) {
                        response.sendRedirect(url_absoluta + "/entrar");
                        return false;
                    }
                }
        }
        
        return true;
    }
}
