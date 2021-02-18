<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>
<div class="site-wrap">
<c:url var="addSearch" value="/bookProd/search" />

<%@ include file="header.jsp" %>
<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"> <strong class="text-black">Book Product</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
    
      <div class="container">
     <sf:form action="${addSearch}" method="post" modelAttribute="form">
        <div class="row mb-5">
     
          <sf:input type="hidden" path="id" />

					<sf:input type="hidden" path="pageNo" />
					<sf:input type="hidden" path="pageSize" />

					<sf:input type="hidden" path="listsize" />
					<sf:input type="hidden" path="total" />
					<sf:input type="hidden" path="pagenosize" />
            <div class="site-blocks-table">
           	<b><%@include file="businessMessage.jsp"%></b>
              <table class="table table-bordered">
                <thead>
                  <tr>                   
                <th class="product-name">Name</th>
				<th class="product-name">ProductName</th>
				<th class="product-name">Email Id</th>
				<th class="product-name">Mobile No</th>
				<th class="product-name">Country</th>
				<th class="product-name">State</th>
				<th class="product-name">City</th>
				<th class="product-remove">PinCode</th>
				<th class="product-remove">Booking Date</th>
				<th class="product-remove">Address</th>
				<th class="product-price">Quantity</th>
				<th class="product-price">Amount</th>
                    
                  </tr>
                </thead>
             
                <tbody>
                
                   <c:forEach items="${list}" var="bp" varStatus="ct">
                  <tr>
                    
                    <td class="product-name">
                      <h2 class="h5 text-black"><c:out value="${bp.name}"/></h2>
                    </td>
                    <td><c:out value="${bp.productName}"/></td>
                    <td><c:out value="${bp.emailId}"/></td>
                    <td><c:out value="${bp.mobileNo}"/></td>
                    <td><c:out value="${bp.country}"/></td>
                     <td><c:out value="${bp.state}"/></td>
                      <td><c:out value="${bp.district}"/></td>
                      <td><c:out value="${bp.pincode}"/></td> 
                       <td><fmt:formatDate pattern="MM/dd/yyyy"
											value="${bp.date}" /></td>
                        <td><c:out value="${bp.address}"/></td>
                         <td><c:out value="${bp.quantity}"/></td>
                           <td><c:out value="${bp.anmount}"/></td>
                  </tr>

             </c:forEach>
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