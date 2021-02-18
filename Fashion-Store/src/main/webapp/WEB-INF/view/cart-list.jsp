<%@page import="java.util.HashMap"%>
<%@page import="in.co.fashion.store.util.HTMLUtility"%>
<%@page import="java.util.List"%>
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
          <div class="col-md-12 mb-0"><strong class="text-black">Cart</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
    
      <div class="container">
        <sf:form action="/Fashion-Store/cart/update" method="post" modelAttribute="form">
        <div class="row mb-5">
          <sf:input type="hidden" path="id" />

		<sf:input type="hidden" path="pageNo" />
		<sf:input type="hidden" path="pageSize" />

		<sf:input type="hidden" path="listsize" />
		<sf:input type="hidden" path="total" />
		<sf:input type="hidden" path="pagenosize" />
            <div class="site-blocks-table">
             <b><%@ include file="businessMessage.jsp" %></b>
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="product-thumbnail">Image</th>
                    <th class="product-name">Name</th>
                     <th class="product-name">Quantity</th>
                    <th class="product-price">Price</th>
                    <th class="product-remove">Description</th>
                    <th class="product-remove">Remove</th>
                    <th class="product-remove">Update</th>
                  </tr>
                </thead>
             
                <tbody>
                <%int i=1;
                	
                 %>
                <c:forEach items="${list}" var="ct" varStatus="cs">
                  <tr>
                    <td class="product-thumbnail">
                      <img src="/Fashion-Store/prod/getImage/<c:out value='${ct.productId}'/>" alt="Image" class="img-fluid">
                    </td>
                    <td class="product-name">
                      <h2 class="h5 text-black">${ct.productName}</h2>
                    <td>
								<input  class="form-control text-center"
									name="quantity<%=i++%>" value="${ct.quantity}" 
									/>
								</td>
                  
                    <td>${ct.price}</td>
                    <td>${ct.description}</td>
                    <td><a href="/Fashion-Store/cart?crId=${ct.id}&operation=Delete" class="btn btn-primary btn-sm">X</a></td>
                    <td><input type="submit" class="btn btn-primary btn-lg btn-block"
										name="operation" value="Update"></td>
                  </tr>
                 </c:forEach>
                 <tr>
                 <td colspan="6">Total : ${totalAmt}</td>
                 <td ><a href="/Fashion-Store/bookProd" class="btn btn-primary btn-sm">Book</a></td>
                 </tr>
                </tbody>
              </table>
            </div>
          
        </div>

      <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
            
              <div class="col-md-6 mb-3 mb-md-0">
                <input type="submit" name="operation" <c:if test="${form.pageNo == 1}">disabled="disabled"</c:if>
					class="btn btn-primary btn-sm btn-block" value="Previous">
              </div>
              <div class="col-md-6">
               <input type="submit" name="operation" <c:if test="${total == pagenosize  || listsize < pageSize   }">disabled="disabled"</c:if>
					class="btn btn-primary btn-sm btn-block"  value="Next">
              </div>
            </div>
            
          </div>
         
      </div>
     </sf:form>
    </div>
    </div>
<div style=" margin-top: 60px">  
<%@ include file="footer.jsp" %>
</div>
</div>