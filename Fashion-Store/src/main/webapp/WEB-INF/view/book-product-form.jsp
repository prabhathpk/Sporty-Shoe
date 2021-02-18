<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>
<div class="site-wrap">
	<%@ include file="header.jsp"%>
	
	
            
	<sf:form action="/Fashion-Store/bookProd" method="post"
		modelAttribute="form">
		<div class="site-section">
			<div class="container">
						  <div class="site-blocks-table">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="product-thumbnail">Image</th>
                    <th class="product-name">Name</th>
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


				<div class="row">
					<div class="col-md-12">
						<h2 class="h3 mb-3 text-black">Fill And Book</h2>

					</div>
					<div class="col-md-7">




						<div class="p-3 p-lg-5 border">

							<s:bind path="name">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">Name<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter Name"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>

							<s:bind path="emailId">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">Email Id<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter Email Id"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>
														
							<s:bind path="mobileNo">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">Mobile No<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter MobileNo"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>
							
							<s:bind path="country">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">Country<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter Country"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>							

							<s:bind path="state">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">State<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter State"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>
							
							<s:bind path="district">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">District<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter District"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>
							
							<s:bind path="pinCode">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">PinCode<span
											class="text-danger">*</span></label>
										<sf:input path="${status.expression}" placeholder="Enter PinCode"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>
							
							<s:bind path="address">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email" class="text-black">Address<span
											class="text-danger">*</span></label>
										<sf:textarea cols="30" rows="4" path="${status.expression}" placeholder="Enter Address"
											class="form-control" />
										<font color="red"><sf:errors
												path="${status.expression}" /></font>
									</div>
								</div>
							</s:bind>
							
							


							<div class="form-group row">
								<div class="col-lg-6">
									<input type="submit" class="btn btn-primary btn-lg btn-block"
										name="operation" value="Payment">
								</div>
								<div class="col-lg-6">
									<input type="submit" class="btn btn-primary btn-lg btn-block"
										name="operation" value="Cancel">
								</div>
							</div>
						</div>

					</div>
			</div>
				</div>
</sf:form>

			</div>
			

		


	<div style="margin-top: 20px">
		<%@ include file="footer.jsp"%>
	</div>
</div>