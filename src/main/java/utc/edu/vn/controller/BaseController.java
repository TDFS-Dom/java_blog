package utc.edu.vn.controller;

import utc.edu.vn.model.UserDomain;
import utc.edu.vn.utils.MapCache;
import utc.edu.vn.utils.TaleUtils;

import javax.servlet.http.HttpServletRequest;

public abstract class BaseController {


    protected MapCache cache = MapCache.single();


    public BaseController title(HttpServletRequest request, String title) {
        request.setAttribute("title", title);
        return this;
    }

    /**
     * 获取请求绑定的登录对象
     * @param request
     * @return
     */
    public UserDomain user(HttpServletRequest request) {
        return TaleUtils.getLoginUser(request);
    }

    /**
     * 获取请求绑定登录用户Uid
     * @param request
     * @return
     */
    public Integer getUid(HttpServletRequest request) {
        return this.user(request).getUid();
    }


    /**
     * 数组转字符串
     * @param arr 数组
     * @return String
     */
    public String join(String[] arr) {
        StringBuilder buffer = new StringBuilder();
        for (String item : arr) {
            buffer.append(",").append(item);
        }
        return buffer.length() > 0 ? buffer.substring(1) : buffer.toString();
    }


}
