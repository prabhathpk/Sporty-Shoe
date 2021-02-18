<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>
<div class="site-wrap">
<%@ include file="header.jsp" %>
<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><strong class="text-black">Shop</strong></div>
        </div>
      </div>
    </div>
	 <sf:form action="/Fashion-Store/prod/home/search" method="post" modelAttribute="form">
    <div class="site-section">
      <div class="container">
	<sf:input type="hidden" path="id" />

		<sf:input type="hidden" path="pageNo" />
		<sf:input type="hidden" path="pageSize" />

		<sf:input type="hidden" path="listsize" />
		<sf:input type="hidden" path="total" />
		<sf:input type="hidden" path="pagenosize" />
        <div class="row mb-5">
          <div class="col-md-9 order-2">

            <div class="row">
              <div class="col-md-12 mb-5">
                <div class="float-md-left mb-4"><h2 class="text-black h5">Shop All</h2>
                <b><%@ include file="businessMessage.jsp" %></b>
                </div>
              </div>
            </div>
            
            <div class="row mb-5">
			<c:forEach items="${list}" var="pd" varStatus="cs">
              <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                <div class="block-4 text-center border">
                  <figure class="block-4-image">
                  <%if(userbean!=null){ %>	
                  	<%if(userbean.getRoleId()==2){ %>
                    <a href="/Fashion-Store/prod/detail?pid=${pd.id}"><img src="/Fashion-Store/prod/getImage/<c:out value='${pd.id}'/>" alt="Image placeholder" class="img-fluid"></a>
                 	<%}else{ %>
                 	<img src="/Fashion-Store/prod/getImage/<c:out value='${pd.id}'/>" alt="Image placeholder" class="img-fluid">
                 	<%} %>
                 	<%}else{ %>
                 	<a href="/Fashion-Store/login?pid=${pd.id}"><img src="/Fashion-Store/prod/getImage/<c:out value='${pd.id}'/>" alt="Image placeholder" class="img-fluid"></a>
                 	<%} %>
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="/Fashion-Store/prod/detail?pid=${pd.id}">${pd.name}</a></h3>
                    <p class="mb-0">${pd.description}</p>
                    <p class="text-primary font-weight-bold">${pd.price}Rs</p>
                  </div>
                </div>
              </div>
              
       </c:forEach>
            </div>
            <div class="row" data-aos="fade-up">
              <div class="col-md-12 text-center">
                <div class="site-block-27">
                  <ul>
                    <li><input type="submit" name="operation" <c:if test="${form.pageNo == 1}">disabled="disabled"</c:if>
					class="btn btn-primary btn-sm btn-block" value="Previous"></li>
                   
                   
                    <li><input type="submit" name="operation" <c:if test="${form.pageNo == 1}">disabled="disabled"</c:if>
					class="btn btn-primary btn-sm btn-block" value="Previous"></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          </div>
            
        </div>
    </div>
    </sf:form>
<%@ include file="footer.jsp" %>
</div>