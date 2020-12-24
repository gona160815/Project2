<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <div style="height:50px " id="dialog_div" title="客服系統">
            <!-- <div class="container" style="height: 0px"> -->

            <div class="messaging" >
                <div class="text-center mb-4">
                    <h1 style="margin-top: 15px;padding-top:0px" class="h3 mb-3 font-weight-normal"><i class="fas fa-headset"></i>&nbsp線上客服</h1>
                    <p id="result"></p>
                </div>
                <div class="inbox_msg">
                    <div class="inbox_people">
                        <div class="headind_srch">
                            <div class="recent_heading" style="text-align: center">
                                <h4>目前在線管理員</h4>
                            </div>
                        </div>
                        <div class="inbox_chat scroll">
                            <c:forEach var="rg" items="${getAdmin}">
                                <!--  <a class="dropdown-item" href="getAdmin?Id=${rg.memberId }">${rg.name }</a>-->
                                <div class=" chat_list" id="${rg.memberId }" onclick="chooseAdmin(this)">
                                    <div class="chat_people">
                                        <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                        <div class="chat_ib">
                                            <h5>${rg.name } <span class="chat_date"></span></h5>
                                            <p>有任何疑問嗎? 讓我來幫您解決。</p>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="${rg.memberId }" />
                            </c:forEach>

                        </div>
                    </div>
                    <div class="mesgs">
                        <c:if test="${! empty message}">
                            <div class="msg_history" id="msg_history">
                                ${message}
                            </div>
                        </c:if>
                        <c:if test="${ empty message}">
                            <div class="msg_history" id="msg_history">
                            </div>
                        </c:if>
                        <div class="type_msg">
                            <div class="input_msg_write">
                                <input type="text" class="write_msg" id="message" placeholder="輸入訊息..." />
                                <button class="msg_send_btn" type="button" id="send"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                                <p id="tou"></p>
                            </div>
                            <button id="mesinput" type="button" class="btn btn-sm btn-primary">一鍵輸入</button>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" id="userId" value="${loginOK.memberId}" />
            <!-- 我方ID -->
            <input type="hidden" id="userName" value="${loginOK.name}" />
            <!-- 我方名字 -->
            <input type="hidden" id="toAdmin" value="${selectedAdmin.memberId}" />
            <!-- 當前對話管理員 -->
            <!--  </div>-->
        </div>
        <div class="chat_on nav-item" id="service">
            <span class="chat_on_icon">
            <i class="text-right align-text-top fa fa-comments" aria-hidden="true">
                <span id="messageNum" class=" badge badge-danger" >0
                </span>
            </i>
            </span>
        </div>
        <script>
            
        </script>