<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>
<div class="site-wrap">
	<%@ include file="header.jsp"%>
	<div class="bg-light py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<strong class="text-black">${prod.name}</strong>
				</div>
			</div>
		</div>
	</div>
	<sf:form action="/Fashion-Store/bookProd" method="post"
		modelAttribute="form">
		<div class="site-section">
			<div class="container">
			 <b><%@include file="businessMessage.jsp"%></b>
				<div class="site-blocks-table">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="product-thumbnail">Image</th>
                    <th class="product-name">Name</th>
                     <th class="product-price">Quantity</th>
                    <th class="product-price">Price</th>
                    <th class="product-remove">Description</th>
                  </tr>
                </thead>
             
                <tbody>
               
                <c:forEach items="${list}" var="ct" varStatus="cs">
                  <tr>
                    <td class="product-thumbnail">
                      <img src="/Fashion-Store/prod/getImage/<c:out value='${ct.productId}'/>" alt="Image" class="img-fluid">
                    </td>
                    <td class="product-name">
                      <h2 class="h5 text-black">${ct.productName}</h2>
                   <td>${ct.quantity}</td>
                    <td>${ct.price}</td>
                    <td>${ct.description}</td>
                  </tr>
                 </c:forEach>
                 <tr>
                 <td colspan="8">Total : ${totalAmt}</td>
                 </tr>
                </tbody>
              </table>
              
            </div>
				</div>
		</div>
	</sf:form>
</div>
