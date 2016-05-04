<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="${sysTitle}" showLoading="false" exportParams="true" isSubPage="false">
<bf:import src="/system/admin/js/login.js" />

<link href="<%=request.getAttribute("cssPath") == null ? request.getContextPath()
                            + "/resource/css/login.css" : request.getAttribute("cssPath")%>" 
                            rel="stylesheet" type="text/css" />
<style>
body {
    /*background-image:url(resource/image/bg_chalkboard.jpg);*/
}
</style>
<bf:body>
    <div id="login">
        <div id="top">
            <div id="top_left"><img src="<%=request.getContextPath()+ "/resource/image/login/login_03.gif"%>" />
            </div>
            <div id="top_center"></div>
        </div>
        <div id="center">
            <div id="center_banner">
                <div class="wrapper">
                    <div id="slideshow" class="box_skitter fn-clear">
                        <ul>
                            <li>
                                <img alt="" class="cubeRandom" src="resource/image/login/banner/banner01.jpg" />
                            </li>
                            <li>
                                <img alt="" class="cubeRandom" src="resource/image/login/banner/banner02.jpg" />
                            </li>
                            <li>
                                <img alt="" class="cubeRandom" src="resource/image/login/banner/banner03.jpg" />
                            </li>
                            <li>
                                <img alt="" class="cubeRandom" src="resource/image/login/banner/banner04.jpg" />
                            </li>
                            <li>
                                <img alt="" class="cubeRandom" src="resource/image/login/banner/banner05.jpg" />
                            </li>
                            <li>
                                <img alt="" class="cubeRandom" src="resource/image/login/banner/banner06.jpg" />
                            </li>
                        </ul>
                    </div>
                    <script type="text/javascript" src="resource/commonjs/slideshow.js"></script>
                    
                </div>
            </div>
            <div id="center_left"></div>
            <div id="center_middle">
                   
            </div>
            <div id="center_right"></div>        
         </div>
         <div id="down">
              <div id="down_left">
                  <div id="inf">
                       <span class="inf_text">版权信息</span>
                       <span class="copyright"><a href="" target=_blank></a> version 3.0</span>
                  </div>
              </div>
              <div id="down_center"></div>       
         </div>
    </div>
</bf:body>
</bf:html>