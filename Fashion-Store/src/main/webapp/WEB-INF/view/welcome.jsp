<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>
<div class="site-wrap">

<%@ include file="header.jsp" %>
<body style="background-color:powderblue;">
      <div class="site-section site-blocks-2">
      <div class="container">
        
      
        <sf:form action="/Fashion-Store/welcome" method="post" modelAttribute="form">
         <sf:input type="hidden" path="id" />
<div class="row">
      <c:forEach items="${list}" var="cd" varStatus="cs">
      
          <div class="col-sm-4" >
            <a class="block-2-item" href="/Fashion-Store/prod/home/search?cId=${cd.id}">
              <figure class="image">
                <img src="/Fashion-Store/category/getImage/<c:out value='${cd.id}'/>" alt="" class="img-fluid">
              </figure>
              <div class="text">
                <h3>${cd.name}</h3>
              </div>
            </a>
          </div>
          
        </c:forEach>
        </div>
         </sf:form>
        
      </div>
    </div>

<%@ include file="footer.jsp" %>
</div>
